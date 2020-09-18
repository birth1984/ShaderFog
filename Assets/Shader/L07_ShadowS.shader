Shader "JSJ/L07_ShadowS"
{
    Properties
    {
        //_MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags 
        {
            "LightMode"="ForwardBase"
        }
        Pass
        {
            Name "FORWARD"
            Tags
            {
                //"LightModel" = "ForwardBase"
                "LightModel" = "ShadowCaster"
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag           
            #include "UnityCG.cginc"
            #pragma multi_compile_shadowcaster
            //#pragma target 3.0

            struct v2f
            {
                V2F_SHADOW_CASTER;
            };

            v2f vert (appdata_base v)
            {
                v2f o;
                TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                SHADOW_CASETER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    //FallBack "DIFFUSE"
    FallBack "Specular"
}
