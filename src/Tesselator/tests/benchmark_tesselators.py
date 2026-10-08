"""Benchmark a rebuilt SWIG module in a fresh process (seconds and peak RSS).

Example:
  python benchmark_tesselators.py --module-dir /tmp/build --kind topology --extract
  python benchmark_tesselators.py --module-dir /tmp/build --kind shape --export x3d
Use identical arguments and separate processes for before/after measurements.
RSS includes Python, OCCT, the shape and output; it is not just mesh storage.
"""
import argparse
import gc
import importlib
import json
import resource
import statistics
import sys
import time

from OCC.Core.BRep import BRep_Builder
from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus
from OCC.Core.TopLoc import TopLoc_Location
from OCC.Core.TopoDS import TopoDS_Compound
from OCC.Core.gp import gp_Trsf, gp_Vec


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--module-dir')
    parser.add_argument('--kind', choices=['shape', 'topology'], required=True)
    parser.add_argument('--instances', type=int, default=1)
    parser.add_argument('--quality', type=float, default=0.12)
    parser.add_argument('--runs', type=int, default=5)
    parser.add_argument('--reuse', action='store_true')
    parser.add_argument('--extract', action='store_true', help='Topology only: read a premeshed shape with deviation=0')
    parser.add_argument('--parallel', action='store_true')
    parser.add_argument('--export', choices=['json', 'x3d'])
    args = parser.parse_args()
    if args.extract and args.kind != 'topology':
        parser.error('--extract requires --kind topology')
    if args.export and args.kind != 'shape':
        parser.error('--export requires --kind shape')
    if args.runs < 1 or args.instances < 1:
        parser.error('--runs and --instances must be positive')
    if args.module_dir:
        sys.path.insert(0, args.module_dir)
        module = importlib.import_module('Tesselator')
    else:
        module = importlib.import_module('OCC.Core.Tesselator')
    cls = getattr(module, 'ShapeTesselator' if args.kind == 'shape' else 'TopologyTesselator')
    base = BRepPrimAPI_MakeTorus(10, 3).Shape()
    if args.extract or args.reuse:
        BRepMesh_IncrementalMesh(base, 0.2 * args.quality, False, 0.5 * args.quality, args.parallel)
    shape = base
    if args.instances > 1:
        shape = TopoDS_Compound()
        builder = BRep_Builder()
        builder.MakeCompound(shape)
        for i in range(args.instances):
            trsf = gp_Trsf()
            trsf.SetTranslation(gp_Vec(30 * (i % 10), 30 * (i // 10), 0))
            builder.Add(shape, base.Moved(TopLoc_Location(trsf)))
    timings = []
    for _ in range(args.runs):
        tess = cls(shape)
        tess.SetDeviation(0 if args.extract else 0.2)
        kw = dict(mesh_quality=args.quality, parallel=args.parallel)
        if args.reuse:
            kw['reuse_mesh'] = True
        start = time.perf_counter()
        tess.Compute(**kw)
        timings.append(time.perf_counter() - start)
        triangles = tess.TriangleCount() if args.kind == 'topology' else tess.ObjGetTriangleCount()
        if not args.export:
            del tess
            gc.collect()
    report = vars(args) | dict(triangles=triangles, compute_median_s=statistics.median(timings), compute_samples_s=timings)
    if args.export:
        timings = []
        for _ in range(args.runs):
            start = time.perf_counter()
            output = tess.ExportShapeToThreejsJSONString('bench') if args.export == 'json' else tess.ExportShapeToX3DTriangleSet()
            timings.append(time.perf_counter() - start)
            length = len(output)
            del output
        report.update(export_median_s=statistics.median(timings), export_bytes=length)
    report['peak_rss_kib'] = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
    print(json.dumps(report, sort_keys=True))


if __name__ == '__main__':
    main()
