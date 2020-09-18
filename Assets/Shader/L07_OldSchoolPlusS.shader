Shader "JSJ/L07_OldSchoolPlusS"
{
    Properties
    {
        _LambertCol ("基本色", Color) = (0.1,0.5,0.5,1)
        _SpecularPow ("高光次幂", Range(1, 90)) = 30
        _EnvUpCol ("环境天顶颜色", Color) = (0.07843135,0.7843137,0.5254213,1)
        _EnvSideCol ("环境水平颜色", Color) = (0.5,0.5,0.5,1)
        _EnvDownCol ("环境地表颜色", Color) = (0.5,0.5,0.5,1)
        _LightCol ("光颜色", Color) = (0.7210653,0.4477572,0.8113208,1)
        _Occlusion ("AO图", 2D) = "white" {}
        _EnvInt ("环境光强度", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            Name "FORWARD"
            Tags
            {
                "LightMode" = "ForwardBase"
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "AutoLight.cginc" // 使用Unity投影必须包含这两个库文件
            #include "Lighting.cginc" // 同上
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0

            struct VertexInput
            {
                float4 vertex       : POSITION;
                float3 normal       : NORMAL;
                float2 uv0          : TEXCOORD0 ;
            };

            struct VertexOutput
            {             
                float4 pos : SV_POSITION;
                //float3 nDirWS : TEXCOORD0;
                float2 uv0 : TEXCOORD0;
                float4 posWS : TEXCOORD1;
                float3 nDirWS : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };

            float4 _LambertCol ;
            float _SpecularPow ;
            float4 _EnvUpCol ;
            float4 _EnvSideCol ;
            float4 _EnvDownCol ;
            float4 _LightCol ;
            sampler2D _Occlusion;
            float4 _MainTex_ST;
            float _EnvInt ;

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0 ;
                o.posWS = mul(unity_ObjectToWorld , v.vertex) ;
                o.nDirWS = UnityObjectToWorldNormal(v.normal) ;               
                TRANSFER_VERTEX_TO_FRAGMENT(o);
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                float3 nDir = normalize(i.nDirWS) ;
                float3 lDir = _WorldSpaceLightPos0.xyz ;
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.pos.xyz) ;
                float3 rDir = reflect(-lDir , nDir) ;
                
                // 准备兰伯特&Phong的点积
                float ndotl = dot(nDir , lDir) ;
                float vdotr = dot(vDir , rDir) ;

                // 光照模型（直接光照）
                float shadow = LIGHT_ATTENUATION(i) ;
                float lambert = max(0.0 , ndotl) ;
                float phong = pow( max(0.0 , vdotr) , _SpecularPow) ;
                float3 dirLighting = (_LambertCol * lambert + phong) * _LightCol * shadow ;
                
                // 光照模型（环境光照）
                float upMask = max( 0.0 , nDir.g) ;
                float downMask = max(0.0 , -nDir.g) ;
                float sideMask = 1.0 - upMask - downMask ;

                // 混合环境色
                float3 envCol = _EnvUpCol * upMask +_EnvSideCol * sideMask + _EnvDownCol * downMask ;
                float occlusion = tex2D(_Occlusion , i.uv0) ;
                float3 envLighting = envCol * _EnvInt * occlusion  ;
                return float4(dirLighting* envLighting , 1.0);
                
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
