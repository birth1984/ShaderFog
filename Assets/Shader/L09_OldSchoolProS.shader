Shader "Unlit/L09_OldSchoolProS"
{
    Properties
    {
        [Header(Texture)]
            _MainTex    ("基础贴图", 2D) = "white" {}
            //_Occlusion  ("环境遮挡", 2D) = "white" {}
            _NormalMap  ("法线贴图", 2D) = "bump" {}            
            _SpecTex    ("高光颜色", 2D) = "gray" {}
            _EmitTex    ("环境贴图" ， 2D) = "black"{}
            _CubeMap    ("环境贴图", Cube) = "_Skybox" {}
        [Header(Diffuse)]
            _BaseCol    ("基本色", Color) = (0.5,0.5,0.5,1)
            _EntDiffInt ("环境光镜面反色强度", Range(0, 1)) = 0
            _EnvUpCol   ("环境光天顶颜色", Color) = (0.5,0.5,0.5,1)
            _EnvSideCol ("环境光水平颜色", Color) = (0.5,0.5,0.5,1)
            _EnvDownCol ("环境光地表颜色", Color) = (0.5,0.5,0.5,1)                      
        [Header(Specular)]
            _SpecPow    ("高光次幂", Range(1, 90)) = 1
            _EnvSpeclInt("环境镜面反射强度", Range(0, 5)) = 0
            _FresnelPow ("菲涅尔次幂", Range(0, 10)) = 0
            _CubemapMip ("环境球Mip", Range(0, 7)) = 0        
        [Header(Emission)]
            _LightCol   ("自发光颜色", Color) = (0.5,0.5,0.5,1)
            _EmitInt    ("自发光强度" ， Range(1,10)) = 1 
    
 
        
        
        
        
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0

            // Texture
            sampler2D _MainTex;   //uniform float4 _MainTex_ST;
            sampler2D _Occlusion; //uniform float4 _Occlusion_ST;
            sampler2D _NormalMap; //uniform float4 _NormalMap_ST;            
            samplerCUBE _CubeMap;            
            // DIFFUSE 漫反射
            float4 _BaseCol ;
            float4 _EnvUpCol;
            float4 _EnvSideCol;
            float4 _EnvDownCol;
            float _Entint;
            // Specular 镜面反色
            float _SpecPow;
            float _CubemapMip;
            float _FresnelPow;
            float _EnvSpeclInt;
            // Emission  光照
            float4 _LightCol;    
            float _EmitInt ;
            
            

            struct vertexInput
            {
                float4 vertex : POSITION;   // 顶点信息 GET√
                float3 normal :NORMAL ;     // 发现信息 GET√
                float4 tangent : TANGENT ;  // 切线信息 GET√
                float2 uv : TEXCOORD0;      // UV信息 GET√
            };

            struct vertexOutput
            {
                float4 pos : SV_POSITION;   // 屏幕顶点位置
                float2 uv0 : TEXCOORD0 ;    // UV0  
                float4 posWS : TEXCOORD1 ;  // 世界空间顶点位置    
                float3 nDirWS : TEXCOORD2 ; // 世界空间法线方向
                float3 tDirWS : TEXCOORD3 ; // 世界空间切线方向
                float3 bDirWS : TEXCOORD4 ; // 世界空间副切线方向
                LIGHTING_COORDS(5,6)               
            };


            vertexOutput vert (vertexInput v)
            {
                vertexOutput o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv ;
                o.posWS = mul(unity_ObjectToWorld , v.vertex) ;
                o.nDirWS = UnityObjectToWorldNormal(v.normal) ;
                o.tDirWS = normalize(mul(unity_ObjectToWorld , float4(v.tangent.xyz , 0.0)).xyz) ;
                o.bDirWS = normalize(cross(o.nDirWS , o.tDirWS) * v.tangent.w) ;
                TRANSFORM_VERTEX_FRAGMENT(o)
                return o;
            }

            fixed4 frag (vertexOutput i) : COLOR
            {
                // 准备向量
                float3 nDirTS = UnpackNormal(tex2D(_NormalMap , i.uv0)).rgb ;
                float3x3 TBN = float3x3(i.tDirWS , i.bDirWS , i.nDirWS) ;
                float3 nDirWS = normalize( mul(nDirTS , TBN) ) ;
                float3 vDirWS = normalize( _WorldSpaceCameraPos.xyz - i.posWS.xyz ) ;
                float3 vrDirWS = reflect(-vDirWS , nDirWS) ;
                float3 lDirWS = _WorldSpaceLightPos0.xyz ;
                float3 lrDirWS = reflect(-lDirWS , nDirWS) ;
                // 准备点积结果
                float ndotl = dot(nDirWS , lDirWS) ;    //lambert
                float vdotr = dot(vDirWS , lrDirWS) ;   // phong
                float vdotn = dot(vDirWS , nDirWS) ;    // fresnel 

                // 采样纹理
                float4 var_MainTex = tex2D(_MainTex , i.uv0) ;
                float4 var_SpecTex = tex2D(_SpecTex , i.uv0) ;
                float3 var_EmitTex = tex2D(_EmitTex , i.uv0) ;
                float3 var_Cubemap = texCUBElod(_CubeMap , float4(vrDirWS , lerp(_CubemapMip , 0.0 , var_SpecTex.a))).rgb ;

                // 光照模型（直接光源部分）
                float3 baseCol = var_MainTex.rgb * _BaseCol ;
                float lambert = max(0.0 , ndotl) ;
                float3 specCol = var_SpecTex.rgb ;
                float specPow = lerp(1 , _SpecPow , var_SpecTex.a) ;
                float phong = pow( max(0.0 , vdotr) , specPow) ;
                float shadow = LIGHT_ATTENUATION(i) ;
                float3 dirLighting = (baseCol * lambert + specCol * phong) * _LightColor0 * shadow ;
                // 光照模型（环境光照部分）
                float upMask = max(0.0 , nDirWS.g) ;
                float downMask = max(0.0 , -nDirWS.g) ;
                float sideMask = 1.0 - upMask - downMask ;
                float3 evnCol = _EnvUpCol*upMask + _EnvSideCol * sideMask ;+ _EnvDownCol * downMask ;

                float frenel = pow( max(0.0 , 1 - vdotn) , _FresnelPow) ;
                float occlusion = var_MainTex.a ;

                float3 envLighting = (baseCol * envCol * _EntDiffInt + var_Cubemap * fresnel * _EnvSpeclInt * var_SpecTex.a) * occlusion ;
                // 光照模型（自发光部分）
                float3 emission = var_EmitTex * _EmitInt
                // 结果
                float3 finalRGB = dirLighting + envLighting + emission ;
                return float4(finalRGB , 1.0) ;
            }
            ENDCG
        }
    }
}
