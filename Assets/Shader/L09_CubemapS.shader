﻿Shader "JSJ/L09_CubemapS"
{
    Properties
    {
        _NormalMap ("法线贴图", 2D) = "bump" {}
        _CubeMap ("环境球", Cube) = "_Skybox" {}
        _CubemapMip ("环境球Mip", Range(0, 7)) = 0
        _FresnelPow ("菲涅尔次幂", Range(0, 10)) = 1
        _EnvSpecInt ("环境镜面反射强度", Range(0, 5)) = 0.2
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
                "LightMode"="ForwardBase"
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0

            struct VertexInput
            {
                float4 vertex   : POSITION;
                float2 uv0      : TEXCOORD0;
                float3 normal   :NORMAL ;
                float4 tangent  :TANGENT ;
            };

            struct VertexOutput
            {                
                float4 pos      : SV_POSITION;
                float2 uv0      : TEXCOORD0;
                float4 posWS    : TEXCOORD1 ;
                float3 nDirWS   : TEXCOORD2 ;
                float3 bDirWS   : TEXCOORD3 ;
                float3 tDirWS   : TEXCOORD4 ;                               
            };

            sampler2D   _NormalMap ;
            samplerCUBE   _CubeMap  ;
            float       _CubemapMip ;
            float       _FresnelPow ;
            float       _EnvSpecInt;

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.pos       = UnityObjectToClipPos(v.vertex);
                o.uv0       = v.uv0 ;
                o.posWS     = mul(unity_ObjectToWorld , v.vertex) ;                                     //顶点位置 OS>WS
                o.nDirWS    = UnityObjectToWorldNormal(v.normal) ;                                      //法线信息 OS>WS
                o.tDirWS    = normalize( mul(unity_ObjectToWorld , float4(v.tangent.xyz , 0.0)).xyz ) ; //切线方向OS>WS
                o.bDirWS    = normalize( cross(o.nDirWS , o.tDirWS) * v.tangent.w );                    //根据nDir tDir求bDir
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                // 准备向量
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap , i.uv0)).rgb ;
                float3x3 TBN = float3x3(i.tDirWS , i.bDirWS , i.nDirWS) ;
                float3 nDirWS = normalize( mul(i.nDirWS , TBN) ) ; // 计算Fresnel vrDirWS
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);  // 计算Fresnel
                float3 vrDirWS = reflect(-vDirWS , nDirWS); //采样Cubemap

                // 准备中间向量
                float vdotn = dot(vDirWS , nDirWS) ;

                // 光照模型
                float3 var_Cubemap = texCUBElod(_CubeMap , float4(vrDirWS , _CubemapMip)).rgb ;
                float fresnel = pow(max(0.0 , 1.0 - vdotn) , _FresnelPow) ;
                float3 envSpecLighting = var_Cubemap * fresnel * _EnvSpecInt ;
                // 返回值
                return float4(envSpecLighting , 1.0);
            }
            ENDCG
        }
    }
}
