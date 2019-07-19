#ifdef GL_ES
precision mediump float;
#endif

//input from vertex shader
varying vec4 v_color;
varying vec2 v_texCoords;

uniform sampler2D u_texture;

void main() {


	vec4 image = texture2D(u_texture, v_texCoords);
	vec3 mask = vec3(1.0, 1.0, 1.0);

	gl_FragColor = v_color *  (image * ( ( vec4(1.0 - image.x, 1.0 - image.y, 1.0 - image.z, image.w)  *   vec4(mask.x * 2.0, mask.y * 2.0, mask.y * 2.0, 1.0) ) + image  ) );


	//gl_FragColor = v_color * texture2D(u_texture, v_texCoords) * vec4(0.2, 0.2, 0.2, 0.2);
}