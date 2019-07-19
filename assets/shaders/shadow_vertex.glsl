
//our attributes
#define PI 3.1415926538

attribute vec3 a_position; //z used to tell if 1st or 2nd vertex
attribute vec2 tex_coord;

uniform vec2 _LightPosition;			// xy is the position, z is the angle in radians, w is half the viewcone in radians

varying vec2 angle; //x = angle, y is unused
//pass interpolated position
//varying vec2 position_; 
varying vec4 edge; //v1, v2

float ToPolarAngle(vec2 cartesian, vec2 center)
{
	vec2 d = cartesian - center;
    return atan(d.y, d.x);
}

float PolarAngleToClipSpace(float a)
{
	a += PI;
	a *= 2.0f/(PI*2.0f);
	a -= 1.0f;			
	return a;
}

float abs( float a ) {
	if( a< 0.0) {
		return -a;
	}
	
	return a;
}


void main() {
	
	float polar1 = ToPolarAngle(a_position.xy,_LightPosition.xy);
	float polar2 = ToPolarAngle(tex_coord.xy,_LightPosition.xy);
	
	gl_Position = vec4(PolarAngleToClipSpace(polar1) , 0.0, 0.0, 1.0);
	
	
	float diff = abs(polar1-polar2);
	if (diff >= PI)
	{ 
		float maxAngle = max(polar1,polar2);
		if (polar1 == maxAngle)
		{
			polar1 = maxAngle + (2.0 * PI) - diff;
		}
		else
		{
			polar1 = maxAngle;
		}
	}
	
	
	angle = vec2(polar1, 0.0);

	
	
	if( abs(a_position.z) < 0.001) {
		edge = vec4(a_position.xy, tex_coord);
	} else {
		edge = vec4(tex_coord, a_position.xy);
	}

}