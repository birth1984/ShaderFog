Shader "JSJ/L05_Lambert+Phong"
{
    Properties
    {
        _MainCol ("Color", color) = (1.0 , 1.0 , 1.0 , 1.0)
        _SpecularPow("SpecularPow" , Range(1,90)) = 30
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

            uniform float3 _MainCol ;
            uniform float _SpecularPow ;

            struct VertexInput
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct VertexOutput
            {
                float4 posCS : SV_POSITION;
                float3 posWS : TEXCOORD0 ;
                float3 nDirWS : TEXCOORD1 ;
            };


            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.posWS = mul( unity_ObjectToWorld , v.vertex) ;
                o.nDirWS = UnityObjectToWorldNormal(v.normal) ;                               
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                float3 nDir = i.nDirWS ;
                float3 lDir = _WorldSpaceLightPos0.xyz ;
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz) ;
                float3 rDir = reflect(lDir*(-1.0) , nDir) ;
                
                float ndotl = dot(nDir , lDir) ;
                float lambert = max(0.0 , ndotl) ;
                float rdotv = dot(rDir , vDir) ;
                float phong = pow(max(0.0 , rdotv) , _SpecularPow)  ;
                float3 finial = _MainCol * lambert + phong ;
                return float4(finial , 1.0);
            }
            ENDCG
        }
    }
}
