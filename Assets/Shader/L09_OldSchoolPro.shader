// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:35643,y:32520,varname:node_3138,prsc:2|emission-426-OUT;n:type:ShaderForge.SFN_Tex2d,id:3691,x:32555,y:32654,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,cmnt:nDirTS,varname:node_3691,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:1369,x:32740,y:32654,varname:node_1369,prsc:2,tffrom:2,tfto:0|IN-3691-RGB;n:type:ShaderForge.SFN_LightVector,id:904,x:32555,y:32342,cmnt: lDirWS,varname:node_904,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6216,x:32740,y:32410,varname:node_6216,prsc:2|A-904-OUT,B-3258-OUT;n:type:ShaderForge.SFN_Vector1,id:3258,x:32555,y:32486,varname:node_3258,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:9242,x:32914,y:32506,cmnt: rDir,varname:node_9242,prsc:2|A-6216-OUT,B-1369-XYZ;n:type:ShaderForge.SFN_Dot,id:7012,x:33151,y:32421,cmnt: n dot l lambert,varname:node_7012,prsc:2,dt:0|A-904-OUT,B-1369-XYZ;n:type:ShaderForge.SFN_Dot,id:8703,x:33151,y:32596,cmnt: r dot v specular,varname:node_8703,prsc:2,dt:0|A-9242-OUT,B-6864-OUT;n:type:ShaderForge.SFN_ViewVector,id:6864,x:32551,y:33256,varname:node_6864,prsc:2;n:type:ShaderForge.SFN_Clamp01,id:4200,x:33326,y:32421,varname:node_4200,prsc:2|IN-7012-OUT;n:type:ShaderForge.SFN_Clamp01,id:9786,x:33326,y:32596,varname:node_9786,prsc:2|IN-8703-OUT;n:type:ShaderForge.SFN_Color,id:8827,x:33326,y:32235,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_8827,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:8322,x:33522,y:32310,varname:node_8322,prsc:2|A-8827-RGB,B-4200-OUT;n:type:ShaderForge.SFN_Slider,id:6366,x:33169,y:32780,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_6366,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:90;n:type:ShaderForge.SFN_Multiply,id:6192,x:33513,y:32677,varname:node_6192,prsc:2|A-9786-OUT,B-6366-OUT;n:type:ShaderForge.SFN_Add,id:7358,x:33993,y:32459,varname:node_7358,prsc:2|A-650-OUT,B-6192-OUT;n:type:ShaderForge.SFN_Color,id:1864,x:33982,y:32253,ptovrint:False,ptlb:LightCol,ptin:_LightCol,varname:node_1864,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:6271,x:34293,y:32341,varname:node_6271,prsc:2|A-1864-RGB,B-7358-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9267,x:32926,y:33211,varname:node_9267,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-1369-XYZ;n:type:ShaderForge.SFN_Max,id:4982,x:33129,y:33278,varname:node_4982,prsc:2|A-9267-OUT,B-2395-OUT;n:type:ShaderForge.SFN_Vector1,id:2395,x:32926,y:33376,varname:node_2395,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:2180,x:33129,y:33436,varname:node_2180,prsc:2|A-9267-OUT,B-5131-OUT;n:type:ShaderForge.SFN_Vector1,id:5131,x:32926,y:33470,varname:node_5131,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:3172,x:33315,y:33370,varname:node_3172,prsc:2|A-2395-OUT,B-2180-OUT;n:type:ShaderForge.SFN_Vector1,id:2474,x:33129,y:33178,varname:node_2474,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:1612,x:33315,y:33226,varname:node_1612,prsc:2|A-2474-OUT,B-4982-OUT;n:type:ShaderForge.SFN_Subtract,id:3504,x:33504,y:33285,varname:node_3504,prsc:2|A-1612-OUT,B-3172-OUT;n:type:ShaderForge.SFN_Color,id:4538,x:32551,y:33022,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_4538,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:9088,x:32926,y:33022,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:node_9088,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:7931,x:32728,y:33022,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:node_7931,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9107,x:33675,y:33285,varname:node_9107,prsc:2|A-4538-RGB,B-4982-OUT;n:type:ShaderForge.SFN_Multiply,id:5364,x:33675,y:33159,varname:node_5364,prsc:2|A-7931-RGB,B-3172-OUT;n:type:ShaderForge.SFN_Multiply,id:9099,x:33675,y:33024,varname:node_9099,prsc:2|A-9088-RGB,B-3504-OUT;n:type:ShaderForge.SFN_Add,id:4953,x:33902,y:33147,varname:node_4953,prsc:2|A-9099-OUT,B-9107-OUT;n:type:ShaderForge.SFN_Add,id:6820,x:34087,y:33147,varname:node_6820,prsc:2|A-4953-OUT,B-5364-OUT;n:type:ShaderForge.SFN_Slider,id:6077,x:33930,y:33342,ptovrint:False,ptlb:Entint,ptin:_Entint,varname:node_6077,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:1052,x:34281,y:33229,varname:node_1052,prsc:2|A-6820-OUT,B-6077-OUT;n:type:ShaderForge.SFN_Multiply,id:6469,x:34485,y:33144,varname:node_6469,prsc:2|A-1864-RGB,B-1052-OUT;n:type:ShaderForge.SFN_Tex2d,id:5822,x:34485,y:32938,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,cmnt: 环境遮挡,varname:node_5822,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:813,x:34675,y:33028,varname:node_813,prsc:2|A-5822-RGB,B-6469-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:5502,x:34257,y:32142,cmnt: 光源遮挡,varname:node_5502,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3354,x:34464,y:32270,varname:node_3354,prsc:2|A-5502-OUT,B-6271-OUT;n:type:ShaderForge.SFN_Multiply,id:428,x:32739,y:33329,varname:node_428,prsc:2|A-6864-OUT,B-2465-OUT;n:type:ShaderForge.SFN_Vector1,id:2465,x:32551,y:33434,varname:node_2465,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:5298,x:34063,y:33742,varname:node_5298,prsc:2|A-428-OUT,B-1369-XYZ;n:type:ShaderForge.SFN_Slider,id:1089,x:33906,y:33895,ptovrint:False,ptlb:CubemapMip,ptin:_CubemapMip,varname:node_1089,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Cubemap,id:8121,x:34243,y:33810,ptovrint:False,ptlb:CubeMap,ptin:_CubeMap,varname:node_8121,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0|DIR-5298-OUT,MIP-1089-OUT;n:type:ShaderForge.SFN_Fresnel,id:5053,x:34243,y:33980,varname:node_5053,prsc:2|NRM-1369-XYZ,EXP-6922-OUT;n:type:ShaderForge.SFN_Slider,id:6922,x:33906,y:34045,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_6922,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:8594,x:34435,y:33885,varname:node_8594,prsc:2|A-8121-RGB,B-5053-OUT;n:type:ShaderForge.SFN_Slider,id:9550,x:34278,y:34128,ptovrint:False,ptlb:EnvSpeclInt,ptin:_EnvSpeclInt,varname:node_9550,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_Multiply,id:5010,x:34622,y:33992,varname:node_5010,prsc:2|A-8594-OUT,B-9550-OUT;n:type:ShaderForge.SFN_Multiply,id:1408,x:34928,y:33444,varname:node_1408,prsc:2|A-813-OUT,B-5010-OUT;n:type:ShaderForge.SFN_Add,id:426,x:35183,y:32926,varname:node_426,prsc:2|A-3354-OUT,B-1408-OUT;n:type:ShaderForge.SFN_Tex2d,id:4312,x:33522,y:32076,ptovrint:False,ptlb:BaseTex,ptin:_BaseTex,varname:node_4312,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:650,x:33728,y:32185,varname:node_650,prsc:2|A-4312-RGB,B-8322-OUT;proporder:4312-3691-8827-6366-1864-4538-9088-7931-6077-5822-1089-8121-6922-9550;pass:END;sub:END;*/

Shader "JSJ/L09_OldSchoolPro" {
    Properties {
        _BaseTex ("BaseTex", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _BaseCol ("BaseCol", Color) = (0.5,0.5,0.5,1)
        _SpecPow ("SpecPow", Range(1, 90)) = 1
        _LightCol ("LightCol", Color) = (0.5,0.5,0.5,1)
        _EnvUpCol ("EnvUpCol", Color) = (0.5,0.5,0.5,1)
        _EnvSideCol ("EnvSideCol", Color) = (0.5,0.5,0.5,1)
        _EnvDownCol ("EnvDownCol", Color) = (0.5,0.5,0.5,1)
        _Entint ("Entint", Range(0, 1)) = 0
        _Occlusion ("Occlusion", 2D) = "white" {}
        _CubemapMip ("CubemapMip", Range(0, 7)) = 0
        _CubeMap ("CubeMap", Cube) = "_Skybox" {}
        _FresnelPow ("FresnelPow", Range(0, 10)) = 0
        _EnvSpeclInt ("EnvSpeclInt", Range(0, 5)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            uniform samplerCUBE _CubeMap;
            uniform sampler2D _BaseTex; uniform float4 _BaseTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _Entint)
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpeclInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol );
                float4 _BaseTex_var = tex2D(_BaseTex,TRANSFORM_TEX(i.uv0, _BaseTex));
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap))); // nDirTS
                float3 node_1369 = mul( _NormalMap_var.rgb, tangentTransform ).xyz;
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion)); //  环境遮挡
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float node_9267 = node_1369.rgb.g;
                float node_2395 = 0.0;
                float node_4982 = max(node_9267,node_2395);
                float node_3172 = max(node_2395,(node_9267*(-1.0)));
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float _Entint_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Entint );
                float _CubemapMip_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubemapMip );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpeclInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpeclInt );
                float3 node_1408 = ((_Occlusion_var.rgb*(_LightCol_var.rgb*((((_EnvSideCol_var.rgb*((1.0-node_4982)-node_3172))+(_EnvUpCol_var.rgb*node_4982))+(_EnvDownCol_var.rgb*node_3172))*_Entint_var)))*((texCUBElod(_CubeMap,float4(reflect((viewDirection*(-1.0)),node_1369.rgb),_CubemapMip_var)).rgb*pow(1.0-max(0,dot(node_1369.rgb, viewDirection)),_FresnelPow_var))*_EnvSpeclInt_var));
                float3 node_426 = ((attenuation*(_LightCol_var.rgb*((_BaseTex_var.rgb*(_BaseCol_var.rgb*saturate(dot(lightDirection,node_1369.rgb))))+(saturate(dot(reflect((lightDirection*(-1.0)),node_1369.rgb),viewDirection))*_SpecPow_var))))+node_1408);
                float3 emissive = node_426;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            uniform samplerCUBE _CubeMap;
            uniform sampler2D _BaseTex; uniform float4 _BaseTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _Entint)
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpeclInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
