varying vec2 vUv;

void main()
{
    vUv = uv;
    vec4 mvPosition = modelViewMatrix * vec4( position, 1.0 );
    gl_Position = projectionMatrix * mvPosition;
    occVertColor = vec4(0.080,1.000,0.056,1.000);
    occFrontMaterial_Emission = vec4(0.080,1.000,0.056,1.000);
}