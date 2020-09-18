Shader "JSJ/L05_HalfLambertS"
{
    Properties
    {
        
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
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct VertexOutput
            {                   
                float4 pos : SV_POSITION;
                float3 nDirWS : TEXCOORD0 ;
            };

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal) ;                
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                float3 nDir = i.nDirWS ;
                float3 lDir = normalize( _WorldSpaceLightPos0.xyz );
                float nDotl = dot(nDir , lDir) ;
                float halfLambert = nDotl * 0.5 + 0.5 ;
                return float4(halfLambert , halfLambert , halfLambert , 1);
            }
            ENDCG
        }
    }
}
