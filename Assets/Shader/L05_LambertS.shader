Shader "JSJ/L05_LambertS"
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

            VertexOutput vert (VertexInput i)
            {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos(i.vertex) ;
                o.nDirWS = UnityObjectToWorldNormal(i.normal) ;
                return o ;
            }

            float4 frag(VertexOutput i):COLOR
            {
                float3 nDir = i.nDirWS ;
                float3 lDir = normalize (_WorldSpaceLightPos0.xyz) ;
                float nDotl = dot(nDir , lDir) ;
                float lambert = max(0.0 , nDotl) ;
                return float4(lambert ,lambert , lambert , 1) ;
            }
           
            ENDCG
        }
    }
}
