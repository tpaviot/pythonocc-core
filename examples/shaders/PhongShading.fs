// Created on: 2013-10-10
// Created by: Denis BOGOLEPOV
// Copyright (c) 2013-2014 OPEN CASCADE SAS
//
// This file is part of Open CASCADE Technology software library.
//
// This library is free software; you can redistribute it and/or modify it under
// the terms of the GNU Lesser General Public License version 2.1 as published
// by the Free Software Foundation, with special exception defined in the file
// OCCT_LGPL_EXCEPTION.txt. Consult the file LICENSE_LGPL_21.txt included in OCCT
// distribution for complete text of the license and disclaimer of any warranty.
//
// Alternatively, this file may be used under the terms of Open CASCADE
// commercial license or contractual agreement.

varying vec3 View;     //!< Direction to the viewer
varying vec3 Normal;   //!< Vertex normal in view space
varying vec4 Position; //!< Vertex position in view space.

vec3 Ambient;  //!< Ambient  contribution of light sources
vec3 Diffuse;  //!< Diffuse  contribution of light sources
vec3 Specular; //!< Specular contribution of light sources

//! Computes contribution of isotropic point light source
void pointLight (in int  theId,
                 in vec3 theNormal,
                 in vec3 theView,
                 in vec3 thePoint)
{
  vec3 aLight = occLight_Position (theId).xyz;
  if (occLight_IsHeadlight (theId) == 0)
  {
    aLight = vec3 (occWorldViewMatrix * occModelWorldMatrix * vec4 (aLight, 1.0));
  }
  aLight -= thePoint;

  float aDist = length (aLight);
  aLight = aLight * (1.0 / aDist);

  float anAtten = 1.0 / (occLight_ConstAttenuation  (theId)
                       + occLight_LinearAttenuation (theId) * aDist);

  vec3 aHalf = normalize (aLight + theView);

  vec3  aFaceSideNormal = gl_FrontFacing ? theNormal : -theNormal;
  float aNdotL = max (0.0, dot (aFaceSideNormal, aLight));
  float aNdotH = max (0.0, dot (aFaceSideNormal, aHalf ));

  float aSpecl = 0.0;
  if (aNdotL > 0.0)
  {
    aSpecl = pow (aNdotH, gl_FrontFacing ? occFrontMaterial_Shininess() : occBackMaterial_Shininess());
  }

  Diffuse  += occLight_Diffuse  (theId).rgb * aNdotL * anAtten;
  Specular += occLight_Specular (theId).rgb * aSpecl * anAtten;
}

//! Computes contribution of directional light source
void directionalLight (in int  theId,
                       in vec3 theNormal,
                       in vec3 theView)
{
  vec3 aLight = normalize (occLight_Position (theId).xyz);
  if (occLight_IsHeadlight (theId) == 0)
  {
    aLight = vec3 (occWorldViewMatrix * occModelWorldMatrix * vec4 (aLight, 0.0));
  }

  vec3 aHalf = normalize (aLight + theView);

  vec3  aFaceSideNormal = gl_FrontFacing ? theNormal : -theNormal;
  float aNdotL = max (0.0, dot (aFaceSideNormal, aLight));
  float aNdotH = max (0.0, dot (aFaceSideNormal, aHalf ));

  float aSpecl = 0.0;
  if (aNdotL > 0.0)
  {
    aSpecl = pow (aNdotH, gl_FrontFacing ? occFrontMaterial_Shininess() : occBackMaterial_Shininess());
  }

  Diffuse  += occLight_Diffuse  (theId).rgb * aNdotL;
  Specular += occLight_Specular (theId).rgb * aSpecl;
}

//! Computes illumination from light sources
vec4 computeLighting (in vec3 theNormal,
                      in vec3 theView,
                      in vec4 thePoint)
{
  // Clear the light intensity accumulators
  Ambient  = occLightAmbient.rgb;
  Diffuse  = vec3 (0.0);
  Specular = vec3 (0.0);
  vec3 aPoint = thePoint.xyz / thePoint.w;
  for (int anIndex = 0; anIndex < THE_MAX_LIGHTS; ++anIndex)
  {
    int aType = occLight_Type (anIndex);
    if (aType == OccLightType_Direct)
    {
      directionalLight (anIndex, theNormal, theView);
    }
    else if (aType == OccLightType_Point)
    {
      pointLight (anIndex, theNormal, theView, aPoint);
    }
    else if (aType == OccLightType_Spot)
    {
      // Not implemented
    }
  }

  vec4 aMaterialAmbient  = gl_FrontFacing ? occFrontMaterial_Ambient()  : occBackMaterial_Ambient();
  vec4 aMaterialDiffuse  = gl_FrontFacing ? occFrontMaterial_Diffuse()  : occBackMaterial_Diffuse();
  vec4 aMaterialSpecular = gl_FrontFacing ? occFrontMaterial_Specular() : occBackMaterial_Specular();
  return vec4 (Ambient,  1.0) * aMaterialAmbient
       + vec4 (Diffuse,  1.0) * aMaterialDiffuse
       + vec4 (Specular, 1.0) * aMaterialSpecular;
}

//! Entry point to the Fragment Shader
void main()
{
  //gl_FragColor = computeLighting (normalize (Normal),
  //                                normalize (View),
  //                                Position);

  // Do the most evident and stupid thing possible -- render as a solid color
  gl_FragColor = vec4(0.080,1.000,0.056,1.000);

}
