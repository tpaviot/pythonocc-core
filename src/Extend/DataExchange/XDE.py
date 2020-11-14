##Copyright Thomas Paviot (tpaviot@gmail.com)
##and Andreas Plesch (@andreasplesch)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

import json
import os
import re

from OCC.Core.BRep import BRep_Builder
from OCC.Core.IFSelect import IFSelect_RetDone
from OCC.Core.Quantity import Quantity_Color, Quantity_TOC_RGB
from OCC.Core.STEPCAFControl import STEPCAFControl_Reader
from OCC.Core.TDocStd import TDocStd_Document
from OCC.Core.TCollection import TCollection_ExtendedString
from OCC.Core.TDF import TDF_LabelSequence, TDF_Label
from OCC.Core.TopoDS import TopoDS_Shell
from OCC.Core.XCAFDoc import (XCAFDoc_DocumentTool_ShapeTool,
                              XCAFDoc_DocumentTool_ColorTool)

from OCC.Extend.TopologyUtils import TopologyExplorer, get_type_as_string


def _toUnicode(match):
    return chr(int(match.group(1), 16))


def _unescapeStep(name):
    # remove trailing whitespaces
    new_name = name.strip()
    # https://stackoverflow.com/questions/730133/what-are-invalid-characters-in-xml
    replace_dict = {"&": "&amp;", ">": "&gt;", "<": "&lt;", "'": "&apos;", '"': '&quot;'}
    for k, v in replace_dict.items():
        new_name = new_name.replace(k, v)
    reg1 = re.compile(r'\\X\\(..)')
    reg2 = re.compile(r'\\X2\\(....)\\X0\\')
    reg3 = re.compile(r'\\X4\\(........)\\X0\\')
    new_name = reg3.sub(_toUnicode, reg2.sub(_toUnicode, reg1.sub(_toUnicode, new_name)))

    return new_name


class DocFromSTEP:
    def __init__(self, stp_filename, doc_name=""):
        # create an handle to a document
        if not os.path.isfile(stp_filename):
            raise IOError("%s not found." % stp_filename)
        self._doc = TDocStd_Document(TCollection_ExtendedString(doc_name))

        step_reader = STEPCAFControl_Reader()
        step_reader.SetColorMode(True)
        step_reader.SetLayerMode(True)
        step_reader.SetNameMode(True)
        step_reader.SetMatMode(True)
        step_reader.SetGDTMode(True)
        print("read STP file", stp_filename, "...", end="")
        status = step_reader.ReadFile(stp_filename)
        if status == IFSelect_RetDone:
            step_reader.Transfer(self._doc)
            print("done.")
        else:
            raise IOError("failed")


    def get_doc(self):
        return self._doc


class SceneGraphFromDoc:
    def __init__(self, doc, log=False):
        self._output_shapes = {}
        self._scene = []
        self._visited = {}
        self._uid_set = set()
        self._facesInSubshapes = set()

        self._shape_tool = XCAFDoc_DocumentTool_ShapeTool(doc.Main())
        self._color_tool = XCAFDoc_DocumentTool_ColorTool(doc.Main())

        self._locs = []
        self._log = log

        self._get_shapes()

    def to_json_string(self):
        # this requires a specific encoder because some
        # occt objects are not seriazables
        class SceneGraphJSONEncoder(json.JSONEncoder):
            def default(self, obj):
                if hasattr(obj, 'DumpJsonToString'):
                    # it's an occt object
                    return obj.DumpJsonToString()
                elif isinstance(obj, TDF_Label):
                    return "is null: %s" % obj.IsNull()
                else:
                    return json.JSONEncoder.default(self, obj)

        return json.dumps(self._scene, indent=4, sort_keys=True, cls=SceneGraphJSONEncoder)

    def save_as_json(self, filename):
        with open(filename, "w") as f:
            f.write(self.to_json_string())

    def get_scene(self):
        return self._scene

    def get_internal_face_entries(self):
        return self._facesInSubshapes

    def _print_log(self, message):  # TODO: replace with the logging module functions
        if self._log:
            print(message)

    def _get_shapes(self):
        labels = TDF_LabelSequence()
        self._shape_tool.GetFreeShapes(labels)

        self._print_log("Number of shapes at root : " + str(labels.Length()))

        for i in range(labels.Length()):
            root_item = labels.Value(i+1)
            self._get_sub_shapes(root_item, None, self._scene)

    def _get_sub_shapes(self, lab, loc, parent):

        labelString = lab.EntryDumpToString()
        if labelString in self._visited:
            return

        self._visited[labelString] = lab
        name = _unescapeStep(lab.GetLabelName())

        if self._shape_tool.IsAssembly(lab):
            node = {'node' : 'Group',
                    'DEF' : labelString,
                    'name' : name,
                    'children' : [],
                    'is_assembly' : True,
                    'is_part' : False,
                    }
            l_c = TDF_LabelSequence()
            self._shape_tool.GetComponents(lab, l_c)
            for i in range(l_c.Length()):
                label = l_c.Value(i + 1)
                #print("Group Name DEF :", name, labelString)
                if self._shape_tool.IsReference(label):
                    self._print_log("########  component label :" + _unescapeStep(label.GetLabelName()))
                    loc = self._shape_tool.GetLocation(label)
                    #print(" Transform  loc DEF          :", loc.HashCode(100))
                    label_reference = TDF_Label()
                    self._shape_tool.GetReferredShape(label, label_reference)
                    reference_name = _unescapeStep(label_reference.GetLabelName())
                    self._print_log("########  Transform USE to DEF ==> referenced label : "+ reference_name)
                    trafo = {'node' : 'Transform',
                             'DEF' : label.EntryDumpToString(),
                             'name' : reference_name + '-trafo',
                             'transform' : loc,
                             'children': []
                            }
                    reference_entry = label_reference.EntryDumpToString()
                    if reference_entry in self._uid_set: #already defined, use USE
                        reference = {'node' : 'Transform',
                                     'USE' : reference_entry,
                                     'name' : reference_name + '-ref'
                                    }
                        trafo['children'].append(reference)
                    else:
                        self._uid_set.add(reference_entry)
                        self._get_sub_shapes(label_reference, loc, trafo['children'])
                    node['children'].append(trafo)

        elif self._shape_tool.IsSimpleShape(lab): # TODO recursive dive for subsubshapes
            #print("Transform DEF Shape Name :", name, labelString )
            shape = self._shape_tool.GetShape(lab)
            shape_type = get_type_as_string(shape)
            self._print_log(" #######  simpleshape of type " + shape_type + " for : " + name)

            c = self._set_color(lab, shape)
            clabel = self._color_tool.FindColor(c)
            clabelString = clabel.EntryDumpToString()

            #n = c.Name(c.Red(), c.Green(), c.Blue())
            #print('    instance color Name & RGB: ', n, c.Red(), c.Green(), c.Blue())

            labloc = self._shape_tool.GetLocation(lab)
            #print("    Shape Transform: ", labloc.HashCode(100))

            ##subshapes
            l_subss = TDF_LabelSequence()
            self._shape_tool.GetSubShapes(lab, l_subss)
            subcolorsUniform = True

            #always use Transform type for proper USE
            node = {'node': 'Transform',
                    'DEF': labelString,
                    'name': name,
                    'children': [],
                    'is_assembly': False,
                    'is_part': True
                    }

            shapenode = {'node' : 'Shape',
                         'label' : lab,
                         'shape' : shape,
                         'shapeType' : shape_type,
                         'name' : name + '-shape',
                         'color' : [c.Red(), c.Green(), c.Blue()],
                         'color_uid' : clabelString
                        }

            #shapenode is attached below as needed

            if l_subss.Length() == 0:
                node['name'] = node['name'] + '-wrapper'
                shapenode['name'] = name + '-singleshape'

            if not labloc.IsIdentity():
                node['transform'] = labloc

            for i in range(l_subss.Length()):
                lab_subs = l_subss.Value(i+1)
                shape_sub = self._shape_tool.GetShape(lab_subs)
                shape_type = get_type_as_string(shape_sub)
                #print("########  simpleshape subshape of type "+shape_type+" for :", name)
                #l_subsubss = TDF_LabelSequence()
                #self._shape_tool.GetSubShapes(lab_subs, l_subsubss)
                #print("########  subshape has subshapes: " + str(l_subsubss.Length()))
                #print("########  subshape has faces: ", len(solidfaces))
                #print("########  subshape has shells: ", expl.number_of_shells())

                c = self._set_color(lab_subs, shape_sub)
                clabel = self._color_tool.FindColor(c)
                clabelString = clabel.EntryDumpToString()
                #n = c.Name(c.Red(), c.Green(), c.Blue())
                #print('    solidshape color RGB: ', c.Red(), c.Green(), c.Blue(), n)
                node_name = _unescapeStep(lab_subs.GetLabelName())
                def_name = lab_subs.EntryDumpToString()
                subloc = self._shape_tool.GetLocation(lab_subs) # assume identity, otherwise we need another wrapper
                #print("    subshape Transform: ", subloc.HashCode(100))
                #default subshape
                subshapenode = {'node': 'SubShape',
                                'label': lab_subs,
                                'shape': shape_sub,
                                'shapeType': shape_type,
                                'DEF': def_name,
                                'name': node_name + '-subshape',
                                'color': [c.Red(), c.Green(), c.Blue()],
                                'color_uid': clabelString,
                                'trafo': subloc
                                }

                ### look for face colors
                expl = TopologyExplorer(shape_sub)
                solidfaces = list(expl.faces()) # works for all types
                #hasMultiColor = False
                if solidfaces:
                    colorFaceLists = {}
                    colorColors = {}
                    #print ("shapetype of solidface: ", get_type_as_string(solidfaces[0]))
                    facelabel = TDF_Label()
                    for solidface in solidfaces:
                        found = self._shape_tool.FindSubShape(lab, solidface, facelabel)
                        if found:
                            self._facesInSubshapes.add(facelabel.EntryDumpToString())
                            c = self._set_color(facelabel, solidface)
                            clabel = self._color_tool.FindColor(c)
                            clabelString = clabel.EntryDumpToString()
                            if clabelString not in colorColors:
                                colorFaceLists[clabelString] = []
                            colorFaceLists[clabelString].append(solidface) # collect face
                            colorColors[clabelString] = c # collect color

                    # override default color, if only one color, is last color
                    clabel = self._color_tool.FindColor(c)
                    clabelString = clabel.EntryDumpToString()
                    subshapenode['color'] = [c.Red(), c.Green(), c.Blue()]
                    subshapenode['color_uid'] = clabelString

                    if len(list(colorFaceLists)) > 1:
                        subshapenode = {'node' : 'Group',
                                        'label' : lab_subs,
                                        'shape' : shape_sub,
                                        'shapeType' : shape_type,
                                        'DEF' : def_name,
                                        'name' : node_name + '-colorshells',
                                        'children' : []
                                        }
                        f = 0
                        for entry in iter(colorFaceLists):
                            #make new shell with faces of single color
                            builder = BRep_Builder()
                            subshell = TopoDS_Shell() #use compound ?
                            builder.MakeShell(subshell)
                            faces = colorFaceLists[entry]
                            for face in faces: # add faces
                                #print(entry,i,colorLists[entry][i])
                                builder.Add(subshell, face)
                            #shape_type = get_type_as_string(subshell)
                            shape_type = "Shell"
                            c = colorColors[entry]
                            clabel = self._color_tool.FindColor(c)
                            clabelString = clabel.EntryDumpToString()
                            if clabelString != shapenode['color_uid']:
                                subcolorsUniform = False
                            shellnode = {'node' : 'SubShape',
                                         'label' : lab_subs,
                                         'shape' : subshell,
                                         'shapeType' : shape_type,
                                         'DEF' : f"{def_name}:{f}",
                                         'name' : node_name + '-colorshell',
                                         'color' : [c.Red(), c.Green(), c.Blue()],
                                         'color_uid' : clabelString
                                        }
                            subshapenode['children'].append(shellnode) #  add to group
                            f = f + 1
                    #//end grouping into single color
                #//end face color check
                node['children'].append(subshapenode)
            #//end subshapes
            # only attach container shape if all face colors have the same color, required for buggy suspension
            # TODO: look for less heuristics
            if subcolorsUniform:
                node['children'].append(shapenode)
        parent.append(node)

    def _set_color(self, lab, shape):
        #rint('is visible: ',color_tool.IsVisible(lab))
        c = Quantity_Color(0.5, 0.5, 0.5, Quantity_TOC_RGB)  # default color
        colorSet = False
        if (self._color_tool.GetInstanceColor(shape, 0, c) or
                self._color_tool.GetInstanceColor(shape, 1, c) or
                self._color_tool.GetInstanceColor(shape, 2, c)):

            colorSet = True

        if not colorSet:
            if (self._color_tool.GetColor(lab, 0, c) or
                    self._color_tool.GetColor(lab, 2, c) or
                    self._color_tool.GetColor(lab, 1, c)):

                colorSet = True

        if colorSet:
            self._color_tool.SetInstanceColor(shape, 0, c)
            self._color_tool.SetInstanceColor(shape, 1, c)
            self._color_tool.SetInstanceColor(shape, 2, c)

        return c


if __name__ == "__main__":
    # test with the as1_pe.stp file
    step_file = os.path.join('..', '..', '..', 'test', 'test_io', 'as1_pe_203.stp')
    doc_exp = DocFromSTEP(step_file)
    document = doc_exp.get_doc()
    c = SceneGraphFromDoc(document, log=True)
    c.save_as_json("sc.json")
