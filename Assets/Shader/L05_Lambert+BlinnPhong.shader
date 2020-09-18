Shader "JSJ/L05_Lambert+BlinnPhong"
{
    Properties
    {
        _MainCol("颜色" , color) = (1.0 , 1.0 , 1.0 , 1.0)
        _SpecularPow("高光次幂",range(1 , 90)) = 30
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

            //输入参数
            uniform float3 _MainCol ;       // 修饰符 uniform  共享于vert, frage
            uniform float _SpecularPow ;    // 修饰符 attibute 仅用于Vert
                                            // 修饰符 varying  用于vert , frag传数据
            struct VertexInput
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct VertexOutput
            {
                float4 posCS : SV_POSITION; // 裁剪空间顶点位置
                float3 posWS : TEXCOORD0 ;  // 世界空间顶点位置
                float3 nDirWS : TEXCOORD1 ; // 世界空间法线方向
            };            

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld , v.vertex) ;
                o.nDirWS = UnityObjectToWorldNormal(v.normal) ;
                return o;
            }

            fixed4 frag (VertexOutput i) : SV_Target
            {
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz) ;
                float3 nDir = i.nDirWS ;
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz) ;   // 摄像机位置 - 顶点位置 = 视角
                float3 hDir = normalize(vDir + lDir) ;      // 求夹角   向量相加  同方向求夹角  

                float nDotl = dot(nDir , lDir) ;            // lambert
                float nDoth = dot(nDir , hDir) ;            // BlinnPong 
                float lambert = max(0.0 , nDotl)  ;
                float blinnPhong = pow(max(0.0 , nDoth) , _SpecularPow) ;

                float3 finalRGB = _MainCol * lambert + blinnPhong ;
                return float4(finalRGB , 1.0);
            }
            ENDCG
        }
    }
}
