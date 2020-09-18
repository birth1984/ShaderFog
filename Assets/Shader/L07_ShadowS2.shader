Shader "JSJ/L07_ShadowS11111"
{
    Properties{}
    SubShader
    {
        Tags 
        {
            "RenderType"="Opaque"
        }
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"  // 使用Unity投影必须包含这两个文件 
            #include "Lighting.cginc"   // 同上
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0


            struct VertexInput
            {
                float4 vertex : POSITION;                
            };

            struct VertexOutput
            {
                float4 pos : SV_POSITION;
                LIGHTING_COORDS(0,1)           // 投影坐标信息                 
            };

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o = (VertexOutput)0 ;
                o.pos = UnityObjectToClipPos(v.vertex);  //变换顶点信息  顶点坐标--->裁剪空间坐标                
                TRANSFER_VERTEX_TO_FRAGMENT(o)    
                return o;
            }

            float4 frag (VertexOutput i) : COLOR 
            {
                float shadow = LIGHT_ATTENUATION(i) ;   //Unity封装好的函数 可取出投影                            
                return float4(shadow, shadow, shadow, 1.0) ;               
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
