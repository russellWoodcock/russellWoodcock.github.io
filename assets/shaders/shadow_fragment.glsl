//input from vertex shader
#define PI 3.1415926538
uniform vec2 _LightPosition_frag;			// xy is the position, z is the angle in radians, w is half the viewcone in radians

varying vec2 angle; //x = angle, y is unused
//varying vec2 position_; 
//pass interpolated position

varying vec4 edge; //v1, v2

	float Intersect(vec2 lineOneStart, vec2 lineOneEnd, vec2 lineTwoStart, vec2 lineTwoEnd)
	{
		vec2 line2Perp = vec2(lineTwoEnd.y - lineTwoStart.y, lineTwoStart.x - lineTwoEnd.x);
		float line1Proj = dot(lineOneEnd - lineOneStart, line2Perp);

		if (abs(line1Proj) < 1e-4)
			return 0.0f;

		float t1 = dot(lineTwoStart-lineOneStart,line2Perp ) / line1Proj;
		return t1;
	}

void main() {

	float angle = angle.x;
	//if (AngleDiff(angle,_LightPosition_frag.z) > _LightPosition_frag.w)
	//return float4(0,0,0,0);
				
	vec2 realEnd = _LightPosition_frag.xy + (vec2(cos(angle) * 10.0), (sin(angle) * 10.0));
				
	float t = Intersect(_LightPosition_frag.xy, realEnd, edge.xy, edge.zw);
				
	gl_FragColor = vec4(t,t,t,t);

	//if(( (PI+angle.x) > (1.5 * PI) ) || ((PI+angle.x) < (0.5 * PI))) {
			//gl_FragColor = vec4(1.0, 0.0, 0.0, 0.0);
	//} else {
		//float distance = (angle.x + PI) / ( 2.0 * PI);
		//gl_FragDepth = distance;
		//gl_FragColor = vec4(distance, distance, distance, distance);
	//}


}