uniform float2 _V_CW_Angle;
uniform float2 _V_CW_MinimalRadius;
uniform float _CurveFactor;
uniform float4 _V_CW_PivotPoint_Position;
uniform float4 _V_CW_PivotPoint_2_Position;
////////////////////////////////////////////////////////////////////////////
//																		  //
//Constants 															  //
//																		  //
////////////////////////////////////////////////////////////////////////////
static const float2 _zero2 = float2(0,0);
static const float3 _zero3 = float3(0,0,0);
static const float2 _one2 = float2(1,1);
static const float3 _one3 = float3(1,1,1);


////////////////////////////////////////////////////////////////////////////
//																		  //
//Defines    															  //
//																		  //
////////////////////////////////////////////////////////////////////////////
#define SIGN(a) (a.x < 0 ? -1.0f : 1.0f)
#define SIGN2(a) (float2(a.x < 0 ? -1.0f : 1.0f, a.y < 0 ? -1.0f : 1.0f))

#define PI     3.14159265359
#define PI_2   6.28318530717
#define PI_0_5 1.57079632679

#define PIVOT   _V_CW_PivotPoint_Position.xyz
#define PIVOT_2 _V_CW_PivotPoint_2_Position.xyz

inline float Smooth(float x)
{
	float t = cos(x * PI_0_5);

	return 1 - t * t;
}

inline float2 Smooth2(float2 x)
{
	float2 t = cos(x * PI_0_5);

	return _one2 - t * t;
}

inline float3 Smooth3(float3 x)
{
	float3 t = cos(x * PI_0_5);

	return _one3 - t * t;
}

inline void RotateVertex(inout float3 vertex, float3 pivot, float3 axis, float angle)
{
	//degree to rad / 2
	angle *= 0.00872664625;


	float sinA, cosA;
	sincos(angle, sinA, cosA);

	float3 q = axis * sinA;

	//vertex
	vertex -= pivot;
	vertex += 2.0 * cross(q, cross(q, vertex) + vertex * cosA);
	vertex += pivot;		
}

inline void RotateVertexAndNormal(inout float3 vertex, inout float3 normal, float3 pivot, float3 axis, float angle)
{
	//degree to rad / 2
	angle *= 0.00872664625;


	float sinA, cosA;
	sincos(angle, sinA, cosA);

	float4 q = float4(axis * sinA, cosA);


	//normal
	float3 normalPosition = vertex + normal;
	normalPosition -= pivot;
	normalPosition += 2.0 * cross(q.xyz, cross(q.xyz, normalPosition) + q.w * normalPosition);
	normalPosition += pivot;


	//vertex
	vertex -= pivot;
	vertex += 2.0 * cross(q.xyz, cross(q.xyz, vertex) + q.w * vertex);
	vertex += pivot;		


	//normal
	normal = normalize(normalPosition - vertex);
}


inline void Spiral_H_Rotate_X_Positive(inout float3 vertex, float3 pivot, float absoluteValue, float smoothValue, float l, float angle)
{
	if (absoluteValue < 1)
	{
		vertex.x = pivot.x;
		vertex.y += pivot.y * smoothValue;
	}
	else
	{
		vertex.xy += float2(l, pivot.y);
		// vertex.x += l;
		// vertex.y += pivot.y;
	}		

	RotateVertex(vertex, pivot, float3(0, 1, 0), angle * saturate(absoluteValue));
}

inline void Spiral_H_Rotate_X_Negative(inout float3 vertex, float3 pivot, float absoluteValue, float smoothValue, float l, float angle)
{
	if (absoluteValue < 1)
	{
		vertex.x = pivot.x;
		vertex.y += pivot.y * smoothValue;
	}
	else
	{
		vertex.xy += float2(-l, pivot.y);
		// vertex.x -= l;
		// vertex.y += pivot.y;
	}			

	RotateVertex(vertex, pivot, float3(0, -1, 0), angle * saturate(absoluteValue));
}

inline void Spiral_H_Rotate_Z_Positive(inout float3 vertex, float3 pivot, float absoluteValue, float smoothValue, float l, float angle)
{
	if (absoluteValue < 1)
	{
		vertex.z = pivot.z;
		vertex.y += pivot.y * smoothValue;
	}
	else
	{
		vertex.zy += float2(-l, pivot.y);
		// vertex.z -= l;
		// vertex.y += pivot.y;
	}				

	RotateVertex(vertex, pivot, float3(0, 1, 0), angle * saturate(absoluteValue));
}

inline void Spiral_H_Rotate_Z_Negative(inout float3 vertex, float3 pivot, float absoluteValue, float smoothValue, float l, float angle)
{
	if (absoluteValue < 1)
	{
		vertex.z = pivot.z;
		vertex.y += pivot.y * smoothValue;
	}
	else
	{
		vertex.zy += float2(l, pivot.y);
		// vertex.z += l;
		// vertex.y += pivot.y;
	}				

	RotateVertex(vertex, pivot, float3(0, -1, 0), angle * saturate(absoluteValue));
}


inline void Spiral_V_Rotate_X_Positive(inout float3 vertex, float3 pivot, float absoluteValue, float smoothValue, float l, float angle)
{
	if (absoluteValue < 1)
	{
		vertex.x = pivot.x;
		vertex.z += pivot.z * smoothValue;
	}
	else
	{
		vertex.xz += float2(l, pivot.z);
		// vertex.x += l;
		// vertex.z += pivot.z;
	}			

	RotateVertex(vertex, pivot, -float3(0, 0, 1), angle * saturate(absoluteValue));
}

inline void Spiral_V_Rotate_X_Negative(inout float3 vertex, float3 pivot, float absoluteValue, float smoothValue, float l, float angle)
{
	if (absoluteValue < 1)
	{
		vertex.x = pivot.x;
		vertex.z += pivot.z * smoothValue;
	}
	else
	{
		vertex.xz += float2(-l, pivot.z);
		// vertex.x -= l;
		// vertex.z += pivot.z;
	}			

	RotateVertex(vertex, pivot, float3(0, 0, 1), angle * saturate(absoluteValue));
}

inline void Spiral_V_Rotate_Z_Positive(inout float3 vertex, float3 pivot, float absoluteValue, float smoothValue, float l, float angle)
{
	if (absoluteValue < 1)
	{
		vertex.z = pivot.z;
		vertex.x += pivot.x * smoothValue;
	}
	else
	{
		vertex.zx += float2(-l, pivot.x);
		//vertex.z -= l;
  		//vertex.x += pivot.x;
	}			

	RotateVertex(vertex, pivot, -float3(1, 0, 0), angle * saturate(absoluteValue));
}

inline void Spiral_V_Rotate_Z_Negative(inout float3 vertex, float3 pivot, float absoluteValue, float smoothValue, float l, float angle)
{
	if (absoluteValue < 1)
	{
		 vertex.z = pivot.z;
		 vertex.x += pivot.x * smoothValue;
	}
	else
	{
		vertex.zx += float2(l, pivot.x);
		//vertex.z += l;
		//vertex.x += pivot.x;
	}			

	RotateVertex(vertex, pivot, float3(1, 0, 0), angle * saturate(absoluteValue));
}

inline void V_CW_TransformPointAndNormal(inout float4 vertex, inout float3 normal, float3 worldPos, float3 worldTangent, float3 worldBinormal)
{
	float3 v0 = worldPos;
	float3 v1 = v0 + worldTangent;
	float3 v2 = v0 + worldBinormal;

	float2 p = float2(PIVOT.x, PIVOT_2.x);
	float2 radius = abs(p) < _V_CW_MinimalRadius ? _V_CW_MinimalRadius * SIGN2(p) : p;

	float2 angle = _V_CW_Angle * SIGN2(radius)*_CurveFactor;
	float2 l = PI_2 * radius * (angle / 360);


	float3 absZ = abs(PIVOT.zzz - float3(v0.z, v1.z, v2.z)) / l.x;
	float3 smoothAbsZ = Smooth3(absZ);

	float3 absZ_2 = abs(PIVOT_2.zzz - float3(v0.z, v1.z, v2.z)) / l.y;
	float3 smoothAbsZ_2 = Smooth3(absZ_2);


	if (v0.z < PIVOT.z)
	{
		PIVOT.x = radius.x;
		Spiral_H_Rotate_Z_Negative(v0, PIVOT, absZ.x, smoothAbsZ.x, l.x, angle.x);
	}
	else if (v0.z > PIVOT_2.z)
	{
		PIVOT_2.x = radius.y;
		Spiral_H_Rotate_Z_Positive(v0, PIVOT_2, absZ_2.x, smoothAbsZ_2.x, l.y, angle.y);
	}

	if (v1.z < PIVOT.z)
	{
		PIVOT.x = radius.x;
		Spiral_H_Rotate_Z_Negative(v1, PIVOT, absZ.y, smoothAbsZ.y, l.x, angle.x);
	}
	else if (v1.z > PIVOT_2.z)
	{
		PIVOT_2.x = radius.y;
		Spiral_H_Rotate_Z_Positive(v1, PIVOT_2, absZ_2.y, smoothAbsZ_2.y, l.y, angle.y);
	}

	if (v2.z < PIVOT.z)
	{
		PIVOT.x = radius.x;
		Spiral_H_Rotate_Z_Negative(v2, PIVOT, absZ.z, smoothAbsZ.z, l.x, angle.x);
	}
	else if (v2.z > PIVOT_2.z)
	{
		PIVOT_2.x = radius.y;
		Spiral_H_Rotate_Z_Positive(v2, PIVOT_2, absZ_2.z, smoothAbsZ_2.z, l.y, angle.y);
	}


	vertex = mul(unity_WorldToObject, float4(v0, 1));
	normal = normalize(mul((float3x3)unity_WorldToObject, normalize(cross(v2 - v0, v1 - v0))));

	/*
	float2 p = float2(PIVOT.z, PIVOT_2.z);
	float2 radius = abs(p) < _V_CW_MinimalRadius ? _V_CW_MinimalRadius * SIGN2(p) : p;

	float2 angle = _V_CW_Angle * SIGN2(radius);
	float2 l = PI_2 * radius * (angle / 360);


	float3 absX = abs(PIVOT.xxx - float3(v0.x, v1.x, v2.x)) / l.x;
	float3 smoothAbsX = Smooth3(absX);

	float3 absX_2 = abs(PIVOT_2.xxx - float3(v0.x, v1.x, v2.x)) / l.y;
	float3 smoothAbsX_2 = Smooth3(absX_2);


	if (v0.x < PIVOT.x)
	{
		PIVOT.z = radius.x;
		Spiral_H_Rotate_X_Positive(v0, PIVOT, absX.x, smoothAbsX.x, l.x, angle.x);
	}
	else if (v0.x > PIVOT_2.x)
	{
		PIVOT_2.z = radius.y;
		Spiral_H_Rotate_X_Negative(v0, PIVOT_2, absX_2.x, smoothAbsX_2.x, l.y, angle.y);
	}

	if (v1.x < PIVOT.x)
	{
		PIVOT.z = radius.x;
		Spiral_H_Rotate_X_Positive(v1, PIVOT, absX.y, smoothAbsX.y, l.x, angle.x);
	}
	else if (v1.x >  PIVOT_2.x)
	{
		PIVOT_2.z = radius.y;
		Spiral_H_Rotate_X_Negative(v1, PIVOT_2, absX_2.y, smoothAbsX_2.y, l.y, angle.y);
	}

	if (v2.x < PIVOT.x)
	{
		PIVOT.z = radius.x;
		Spiral_H_Rotate_X_Positive(v2, PIVOT, absX.z, smoothAbsX.z, l.x, angle.x);
	}
	else if (v2.x >  PIVOT_2.x)
	{
		PIVOT_2.z = radius.y;
		Spiral_H_Rotate_X_Negative(v2, PIVOT_2, absX_2.z, smoothAbsX_2.z, l.y, angle.y);
	}

	vertex = mul(unity_WorldToObject, float4(v0, 1));
	normal = normalize(mul((float3x3)unity_WorldToObject, normalize(cross(v2 - v0, v1 - v0))));
	*/
}

inline void V_CW_TransformPointAndNormal(inout float4 vertex, inout float3 normal, float4 tangent)
{	
	float3 worldPos = mul(unity_ObjectToWorld, vertex).xyz; 
	float3 worldNormal = UnityObjectToWorldNormal(normal);
	float3 worldTangent = UnityObjectToWorldDir(tangent.xyz);
	float3 worldBinormal = cross(worldNormal, worldTangent) * -1;// * tangent.w;

	V_CW_TransformPointAndNormal(vertex, normal, worldPos, worldTangent, worldBinormal);
}

inline void V_CW_TransformPoint(inout float4 vertex)
{
	float3 worldPos = mul(unity_ObjectToWorld, vertex);

	float2 p = float2(PIVOT.x, PIVOT_2.x);
	float2 radius = abs(p) < _V_CW_MinimalRadius ? _V_CW_MinimalRadius * SIGN2(p) : p;

	float2 angle = _V_CW_Angle * SIGN2(radius)*_CurveFactor;
	float2 l = PI_2 * radius * (angle / 360);

	float2 absZ = abs(float2(PIVOT.z, PIVOT_2.z) - worldPos.zz) / l;
	float2 smoothAbsZ = Smooth2(absZ);


	if (worldPos.z < PIVOT.z)
	{
		PIVOT.x = radius.x;
		Spiral_H_Rotate_Z_Negative(worldPos, PIVOT, absZ.x, smoothAbsZ.x, l.x, angle.x);
	}
	else if (worldPos.z > PIVOT_2.z)
	{
		PIVOT_2.x = radius.y;
		Spiral_H_Rotate_Z_Positive(worldPos, PIVOT_2, absZ.y, smoothAbsZ.y, l.y, angle.y);
	}

	vertex = mul(unity_WorldToObject, float4(worldPos, 1));

	/*
	float3 worldPos = mul(unity_ObjectToWorld, vertex);

	float2 p = float2(PIVOT.z, PIVOT_2.z);
	float2 radius = abs(p) < _V_CW_MinimalRadius ? _V_CW_MinimalRadius * SIGN2(p) : p;


	float2 angle = _V_CW_Angle * SIGN2(radius);
	float2 l = PI_2 * radius * (angle / 360);

	float2 absX = abs(float2(PIVOT.x, PIVOT_2.x) - worldPos.xx) / l;
	float2 smoothAbsX = Smooth2(absX);


	if (worldPos.x < PIVOT.x)
	{
		PIVOT.z = radius.x;
		Spiral_H_Rotate_X_Positive(worldPos, PIVOT, absX.x, smoothAbsX.x, l.x, angle.x);
	}
	else if (worldPos.x.x > PIVOT_2.x)
	{
		PIVOT_2.z = radius.y;
		Spiral_H_Rotate_X_Negative(worldPos, PIVOT_2, absX.y, smoothAbsX.y, l.y, angle.y);
	}

	vertex = mul(unity_WorldToObject, float4(worldPos, 1));
	*/
}

#define CURVED_WORLD_TRANSFORM_POINT_AND_NORMAL(vertex,normal,tangent) V_CW_TransformPointAndNormal(vertex, normal, tangent);
#define CURVED_WORLD_TRANSFORM_POINT(vertex)                           V_CW_TransformPoint(vertex);