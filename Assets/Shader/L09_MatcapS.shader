Shader "JSJ/L09_MatcapS"
{
    Properties
    {
        _NormalMap  ("法线贴图", 2D) = "bump" {}
        _Matcap     ("Matcap", 2D) = "white" {}
        _FresnellPow("菲涅尔次幂", Range(0, 10)) = 1
        _EnvSpecInt ("环境镜面反射强度", Range(0, 5)) = 1
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
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"  

            struct VertexInput
            {
                float4 vertex   : POSITION;     //顶点信息
                float3 normal   : NORMAL ;      //法线信息
                float2 uv       : TEXCOORD0;    //UV信息
                float4 tangent  : TANGENT ;     //切线信息
            };

            struct VertexOutput
            {               
                float4 pos      : SV_POSITION;  //屏幕顶点位置   
                float2 uv0      : TEXCOORD0;    //UV信息 
                float3 posWS    : TEXCOORD1;    //世界顶点位置
                float3 nDirWS   : TEXCOORD2 ;   //世界法线方向
                float3 tDirWS   : TEXCOORD3 ;   //世界切线方向
                float3 bDirWS   : TEXCOORD4 ;   //世界副切线方向
               
            };

            sampler2D   _NormalMap ; 
            sampler2D   _Matcap ;
            float       _FresnellPow ;
            float       _EnvSpecInt ;

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.pos       = UnityObjectToClipPos( v.vertex );       //裁剪空间位置
                o.uv0       = v.uv ;
                o.posWS     = mul( unity_ObjectToWorld , v.vertex ) ; //顶点位置 OS>WS
                o.nDirWS    = UnityObjectToWorldNormal( v.normal ) ;  //法线方向 OS>WS
                o.tDirWS    = normalize( mul( unity_ObjectToWorld , float4(v.tangent.xyz , 0.0 ) ).xyz );  //切线方向OS>WS
                o.bDirWS    = normalize(cross(o.nDirWS , o.tDirWS) * v.tangent.w) ;    //根据nDir tDir 求bDir
                return o;
            }

            fixed4 frag (VertexOutput i) : COLOR
            {
                // 准备向量
                float3 nDirTS = UnpackNormal( tex2D( _NormalMap , i.uv0 ) ).rgb ;   //采样并解码nDirTangleSpace
                float3x3 TBN  = float3x3( i.tDirWS , i.bDirWS , i.nDirWS ) ;
                float3 nDirWS = normalize(mul(nDirTS , TBN)) ;      //计算nDirVS 为了计算Fresnel
                float3 nDirVS = mul(UNITY_MATRIX_V , nDirWS) ;      //计算MatcapUV
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz) ; //计算Fresnel

                // 准备中间变量
                float vdotn = dot(vDirWS , nDirWS) ;
                float2 matcapUV = nDirVS*.5+.5 ;

                // 光照模型
                float3 matcap = tex2D(_Matcap , matcapUV) ;
                float fresnel = pow(max(0.0 , 1 - vdotn) , _FresnellPow) ;
                float3 envSpecLighting = matcap * fresnel * _EnvSpecInt ;

                // 返回值
                return float4(envSpecLighting , 1.0);
            }
            ENDCG
        }
    }
}
