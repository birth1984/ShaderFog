Shader "JSJ/L05_HalfLambertRempTexS"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

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

            sampler2D _MainTex;
            float4 _MainTex_ST;

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
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz) ;
                float nDotl = dot(nDir , lDir) ;
                float halfLambert = nDotl * 0.5 + 0.5 ;
                float2 uv = float2(halfLambert , 0.2 ) ;
                float2 texUV = TRANSFORM_TEX(uv , _MainTex) ;
                float4 texCol = tex2D(_MainTex , texUV) ;
                float3 emissive = texCol.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
}
