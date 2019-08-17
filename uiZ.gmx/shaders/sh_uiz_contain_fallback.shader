//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_pos;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 toy;
uniform vec2 sz;
//uniform sampler2D s_Background;

varying vec4 toy_v;
varying vec2 sz_v;
//varying sampler2D s_Background_v;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_pos = in_Position.xy;
    toy_v = toy;
    sz_v = sz;
    //s_Background_v = s_Background;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec2 v_pos;
varying vec4 v_vColour;
vec4 c;

varying vec4 toy_v;
varying vec2 sz_v;
uniform sampler2D s_Background;

float texa;
vec4 tex;
float gla;

void main()
{

    vec4 toy = toy_v;
    vec2 sz = sz_v;
    //sampler2D s_Background = s_Background_v;

    tex=texture2D( s_Background, v_pos/sz );
    
    //gl_FragColor = tex;
    //gl_FragColor = vec4(1.0,1.0,0.0,1.0);
    //for more info one these two methods see: https://stackoverflow.com/a/37837060
    
    //unbranched method (preferred on other hardware that has issues with dynamic branching)
    c = vec4(1.0,1.0,1.0,max(0.0,min(1.0,(1.0-floor(v_pos.y/toy.a))*(1.0-floor(v_pos.x/toy.z))*(floor(v_pos.x/toy.x))*(floor(v_pos.y/toy.y)))));//original
    gl_FragColor = c * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*vec4(tex.a);

    //passtrough
    //gl_FragColor = v_vColour*texture2D( gm_BaseTexture, v_vTexcoord );*vec4(tex.a);
        
    //branched method (preferred on more modern hardware)
    //gl_FragColor = (v_pos.x>=toy.x && v_pos.y>=toy.y && v_pos.x<=toy.z && v_pos.y<=toy.a) ? gl_FragColor :  vec4(0.0);    
    
    gl_FragColor = vec4(gl_FragColor.rgb*vec3(gl_FragColor.a),gl_FragColor.a);
    
    
}

