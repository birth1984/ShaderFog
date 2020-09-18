Shader "JSJ/L07_3ColAmbientS"
{
    Properties
    {
        _Occlusion      ("Texture", 2D) = "white" {}
        _EnvUpCol       ("朝上环境色" ,color)    = (1.0 , 1.0 , 1.0 , 1.0)
        _EnvSideCol     ("朝上环境色" , color)   = (0.5 , 0.5 , 0.5 , 1.0)
        _EnvDownCol     ("朝上环境色" , color)   = (0.0 , 0.0 , 0.0 , 1.0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }       
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct VertexInput
            {
                float4 vertex   : POSITION;
                float3 normal   : NORMAL;
                float2 uv0      :TEXCOORD0 ;
            };

            struct VertexOutput
            {
                float4 pos      : SV_POSITION ;
                float3 nDirWS   : TEXCOORD0 ;
                float2 uv       : TEXCOORD1 ;
            };

            sampler2D _Occlusion;
            float4 _EnvUpCol;
            float4 _EnvSideCol;
            float4 _EnvDownCol;

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal) ;
                o.uv = v.uv0 ;                
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                float3 nDir = normalize(i.nDirWS) ;
                float upMask = max(0.0 , nDir.g) ;
                float downMask = max(0.0 , -nDir.g) ;
                float sideMask = 1.0 - upMask - downMask ;

                float3 envColor = _EnvUpCol * upMask + _EnvSideCol * sideMask + _EnvDownCol * downMask ;
                float3 occlusion  = tex2D(_Occlusion , i.uv) ;
                float3 envLighting = envColor * occlusion ;

                
                return float4(envLighting , 1.0);
            }
            ENDCG
        }
    }
}
