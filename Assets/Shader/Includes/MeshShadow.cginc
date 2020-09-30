#include "UnityCG.cginc"
#include "Assets/Shader/Includes/WorldCurvedCG.cginc"
fixed _ShadowOffsetX;
fixed _ShadowOffsetY;
fixed _ShadowOffsetZ;
fixed4 _LightDir;
fixed4 _ShadowColor;
int _ShadowEffect;

struct shadow_v2f
{
	float4 pos : SV_POSITION;
	float4 col : COLOR;
};


shadow_v2f shadow_vert(appdata_base v)
{
shadow_v2f o;
	CURVED_WORLD_TRANSFORM_POINT(v.vertex);
	float4 worldPos = mul(unity_ObjectToWorld, v.vertex);
#if USE_REAL_DIRLIGHT	
	float3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
#else
	float3 lightDir = normalize(_LightDir.xyz);
#endif
	
	//Y轴取反
	float PosY = _ShadowOffsetY - worldPos.y;

	float rate = PosY / lightDir.y;
	float PosX = lightDir.x* rate + worldPos.x + _ShadowOffsetX;
	float PosZ = lightDir.z* rate + worldPos.z + _ShadowOffsetZ;
	float4 FinalworldPos = float4(PosX,_ShadowOffsetY+0.01, PosZ, 1.0);
	o.pos = mul(UNITY_MATRIX_VP, FinalworldPos);
	o.col = _ShadowColor;
	o.col.a *= 0.7;
	return o;
}

fixed4 shadow_frag(shadow_v2f i) :SV_Target
{
	fixed4 col = i.col*_ShadowEffect;
	return col;
}