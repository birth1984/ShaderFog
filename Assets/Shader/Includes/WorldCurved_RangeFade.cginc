#ifndef VACUUM_CURVEDWORLD_RANGE_FADE_CGINC
#define VACUUM_CURVEDWORLD_RANGE_FADE_CGINC


	uniform float2 _V_CW_RangeFade;	//Contains Min Max values

	float _V_CW_RangeFadeValue;
	#define CURVEDWORLD_RANGE_FADE_VALUE _V_CW_RangeFadeValue

	#ifdef V_CW_RANGE_FADE
		#define CURVEDWORLD_RANGE_FADE_COORDINATE(idx)      float3 worldPosBeforeBend : TEXCOORD##idx;
		#define CURVEDWORLD_RANGE_FADE_SETUP(output,vertex) output.worldPosBeforeBend = mul(unity_ObjectToWorld, float4(vertex.xyz, 1)).xyz;

		#if defined(BENDTYPE_SPIRAL_HORIZONTAL_AXIS_X_POSITIVE) || defined(BENDTYPE_SPIRAL_HORIZONTAL_AXIS_X_NEGATIVE) || defined(BENDTYPE_SPIRAL_HORIZONTAL_DOUBLE_AXIS_X) || defined(BENDTYPE_SPIRAL_HORIZONTAL_ROLLOFF_AXIS_X) || defined(BENDTYPE_SPIRAL_VERTICAL_AXIS_X_POSITIVE) || defined(BENDTYPE_SPIRAL_VERTICAL_AXIS_X_NEGATIVE) || defined(BENDTYPE_SPIRAL_VERTICAL_DOUBLE_AXIS_X) || defined(BENDTYPE_SPIRAL_VERTICAL_ROLLOFF_AXIS_X)
			
			#define CURVEDWORLD_RANGE_FADE_CALCULATE(input)     _V_CW_RangeFadeValue = (input.worldPosBeforeBend.x < _V_CW_RangeFade.x || input.worldPosBeforeBend.x > _V_CW_RangeFade.y) ?  1 : 0;

		#elif defined(BENDTYPE_SPIRAL_HORIZONTAL_AXIS_Z_POSITIVE) || defined(BENDTYPE_SPIRAL_HORIZONTAL_AXIS_Z_NEGATIVE) || defined(BENDTYPE_SPIRAL_HORIZONTAL_DOUBLE_AXIS_Z) || defined(BENDTYPE_SPIRAL_HORIZONTAL_ROLLOFF_AXIS_Z) || defined(BENDTYPE_SPIRAL_VERTICAL_AXIS_Z_POSITIVE) || defined(BENDTYPE_SPIRAL_VERTICAL_AXIS_Z_NEGATIVE) || defined(BENDTYPE_SPIRAL_VERTICAL_DOUBLE_AXIS_Z) || defined(BENDTYPE_SPIRAL_VERTICAL_ROLLOFF_AXIS_Z)

			#define CURVEDWORLD_RANGE_FADE_CALCULATE(input)     _V_CW_RangeFadeValue = (input.worldPosBeforeBend.z < _V_CW_RangeFade.x || input.worldPosBeforeBend.z > _V_CW_RangeFade.y) ?  1 : 0;

		#else

			#define CURVEDWORLD_RANGE_FADE_CALCULATE(input)     _V_CW_RangeFadeValue = 0;

		#endif
		
	#else
		#define CURVEDWORLD_RANGE_FADE_COORDINATE(idx)
		#define CURVEDWORLD_RANGE_FADE_SETUP(output,vertex)
		#define CURVEDWORLD_RANGE_FADE_CALCULATE(input)		   _V_CW_RangeFadeValue = 0;
	#endif


#endif