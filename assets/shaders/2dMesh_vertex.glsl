//our attributes
attribute vec2 a_position;

//our camera matrix
uniform mat3 u_projTrans;
uniform int proj;

varying vec4 vColor;

float abs(float a) {
	if(a < 0.0) {
		return -1.0 * a;		
	} else {
		return a;
	}
}

bool floatNEq(float a, float b) {
	if(abs(a - b) < 0.001) {
		return false;
	} else {
		return true;
	}

}

bool floatEq(float a, float b) {
	if(abs(a - b) < 0.001) {
		return true;
	} else {
		return false;
	}

}

void main() {
	
	vec3 tempPos = u_projTrans * vec3(a_position.xy, 1.0);
			
	float color = tempPos.y / tempPos.z;

	if(  ( (tempPos.y / tempPos.z) >= 1.0 ) || ( (tempPos.y / tempPos.z) < 0.0 ) ) {
			vColor = vec4(1.0, 0.0, 0.0, 1.0);
	} else {
		vColor = vec4(color, color, color, 1.0);

	}
	
	if(proj == 1) {
		gl_Position = vec4(tempPos.x / tempPos.z , 0.0, 1.0, 1.0);

	} else {
		gl_Position = vec4(a_position.xy, 0.0, 100.0);
	}
	
	
}