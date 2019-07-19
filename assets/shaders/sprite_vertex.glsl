#ifdef GL_ES
precision mediump float;
#endif


attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord0;

//our camera matrix
uniform mat4 u_projTrans;

varying vec4 v_color;
varying vec2 v_texCoords;


void main() {
	
	gl_Position = u_projTrans * a_position;
	v_color = a_color;
	v_texCoords = a_texCoord0;
	
	
}