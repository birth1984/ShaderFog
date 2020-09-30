Shader "JSJ/Floor" 
{
    Properties 
    {
        _Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Texture", 2D) = "white" {}
		_CurveFactor("CurveFactor", Float) = 1
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0	

        _CurveFactor("CurveFactor", Float) = 1
        _V_CW_PivotPoint_Position("_V_CW_PivotPoint_Position", Vector) = (0,0,0,0)
        _V_CW_PivotPoint_2_Position("_V_CW_PivotPoint_2_Position", Vector) = (0,0,0,0)
        _V_CW_Angle("_V_CW_Angle", Vector) = (0,0,0,0)
        _V_CW_MinimalRadius("_V_CW_MinimalRadius", Vector) = (0,0,0,0)        
    }
    SubShader 
    {
        Tags 
        {
            "RenderType"="Opaque"
        }
        //Pass 
        //{                       
            CGPROGRAM
            #pragma surface surf Standard fullforwardshadows vertex:vert addshadow
		    #pragma multi_compile_fog
            #include "Assets/Shader/Includes/WorldCurvedCG.cginc"


            sampler2D _MainTex;
		    half _Glossiness;
		    half _Metallic;
		    fixed4 _Color;
            struct Input
            {
                float2 uv_MainTex ;
            } ;

            

            void vert (inout appdata_full v, out Input o) 
            {
                UNITY_INITIALIZE_OUTPUT(Input,o); 
			    //CurvedWorld vertex transform
			    CURVED_WORLD_TRANSFORM_POINT_AND_NORMAL(v.vertex, v.normal, v.tangent);                
            }

            void surf(Input IN , inout SurfaceOutputStandard o)
            {
                // Albedo comes from a texture tinted by color
                fixed4 c = tex2D (_MainTex, IN.uv_MainTex)*_Color;
			    o.Albedo = c.rgb;
			    // Metallic and smoothness come from slider variables
			    o.Metallic = _Metallic;
			    o.Smoothness = _Glossiness;
			    o.Alpha = c.a;
            }           
            ENDCG
        //}
    }
}
