// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33807,y:32851,varname:node_3138,prsc:2|emission-1521-OUT;n:type:ShaderForge.SFN_Tex2d,id:4379,x:32465,y:32682,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4379,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:300af8335acce7c4d91b04951d8d5165,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2988,x:31311,y:33136,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_2988,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:84c2d783d5027ad45b331065656aba4d,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:1226,x:31501,y:33136,varname:node_1226,prsc:2,tffrom:2,tfto:0|IN-2988-RGB;n:type:ShaderForge.SFN_LightVector,id:2945,x:31311,y:32837,varname:node_2945,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6681,x:31501,y:32904,varname:node_6681,prsc:2|A-2945-OUT,B-4866-OUT;n:type:ShaderForge.SFN_Vector1,id:4866,x:31311,y:32987,varname:node_4866,prsc:2,v1:-1;n:type:ShaderForge.SFN_Dot,id:9751,x:32272,y:32934,cmnt: Lambert,varname:node_9751,prsc:2,dt:0|A-6681-OUT,B-1226-XYZ;n:type:ShaderForge.SFN_Clamp01,id:5103,x:32465,y:32934,varname:node_5103,prsc:2|IN-9751-OUT;n:type:ShaderForge.SFN_ViewVector,id:3700,x:31504,y:33437,varname:node_3700,prsc:2;n:type:ShaderForge.SFN_Reflect,id:3454,x:31939,y:33136,varname:node_3454,prsc:2|A-6681-OUT,B-1226-XYZ;n:type:ShaderForge.SFN_Dot,id:5008,x:32278,y:33194,cmnt: Phong,varname:node_5008,prsc:2,dt:0|A-3454-OUT,B-3700-OUT;n:type:ShaderForge.SFN_Slider,id:6993,x:32323,y:33511,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_6993,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:4.521739,max:10;n:type:ShaderForge.SFN_Color,id:7220,x:32465,y:32488,ptovrint:False,ptlb:LightCol,ptin:_LightCol,varname:node_7220,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9126,x:32936,y:32757,varname:node_9126,prsc:2|A-4379-RGB,B-5103-OUT;n:type:ShaderForge.SFN_Clamp01,id:797,x:32468,y:33194,varname:node_797,prsc:2|IN-5008-OUT;n:type:ShaderForge.SFN_Add,id:8101,x:33195,y:33046,varname:node_8101,prsc:2|A-9126-OUT,B-2795-OUT;n:type:ShaderForge.SFN_Tex2d,id:7932,x:32887,y:33749,ptovrint:False,ptlb:AO,ptin:_AO,varname:node_7932,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:951ba424d3c4fb24a8a1a83741225129,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Add,id:5444,x:33442,y:33187,varname:node_5444,prsc:2|A-8101-OUT,B-3275-OUT;n:type:ShaderForge.SFN_Power,id:2795,x:32700,y:33338,varname:node_2795,prsc:2|VAL-797-OUT,EXP-6993-OUT;n:type:ShaderForge.SFN_Cubemap,id:9467,x:32432,y:33712,ptovrint:False,ptlb:Cubemap,ptin:_Cubemap,varname:node_9467,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:6512dbc1007d3f545bb8abd1ab9a8783,pvfc:0|DIR-8487-OUT,MIP-4159-OUT;n:type:ShaderForge.SFN_Slider,id:4159,x:32067,y:33762,ptovrint:False,ptlb:CubemapMip,ptin:_CubemapMip,varname:node_4159,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Multiply,id:5384,x:31700,y:33559,varname:node_5384,prsc:2|A-3700-OUT,B-8880-OUT;n:type:ShaderForge.SFN_Vector1,id:8880,x:31504,y:33664,varname:node_8880,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:8487,x:31937,y:33580,varname:node_8487,prsc:2|A-5384-OUT,B-1226-XYZ;n:type:ShaderForge.SFN_Fresnel,id:6339,x:32180,y:34045,varname:node_6339,prsc:2|NRM-1226-XYZ,EXP-8534-OUT;n:type:ShaderForge.SFN_Slider,id:8534,x:31809,y:34117,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_8534,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:7831,x:32669,y:33857,varname:node_7831,prsc:2|A-9467-RGB,B-6339-OUT;n:type:ShaderForge.SFN_Slider,id:6955,x:32512,y:34043,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_6955,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:5;n:type:ShaderForge.SFN_Multiply,id:12,x:32887,y:33939,varname:node_12,prsc:2|A-7831-OUT,B-6955-OUT;n:type:ShaderForge.SFN_Multiply,id:3275,x:33117,y:33837,varname:node_3275,prsc:2|A-7932-RGB,B-12-OUT;n:type:ShaderForge.SFN_Tex2d,id:2495,x:33249,y:32604,ptovrint:False,ptlb:EftTex,ptin:_EftTex,varname:node_2495,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:1521,x:33606,y:32974,varname:node_1521,prsc:2|A-8767-OUT,B-5444-OUT;n:type:ShaderForge.SFN_Slider,id:6572,x:33136,y:32811,ptovrint:False,ptlb:EftPow,ptin:_EftPow,varname:node_6572,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4782608,max:5;n:type:ShaderForge.SFN_Multiply,id:8767,x:33429,y:32669,varname:node_8767,prsc:2|A-2495-RGB,B-6572-OUT;proporder:4379-2988-6993-7220-7932-9467-4159-8534-6955-2495-6572;pass:END;sub:END;*/

Shader "JSJ/L09_OldSchoolLMR" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Normal ("Normal", 2D) = "bump" {}
        _SpecPow ("SpecPow", Range(1, 10)) = 4.521739
        _LightCol ("LightCol", Color) = (0.5,0.5,0.5,1)
        _AO ("AO", 2D) = "black" {}
        _Cubemap ("Cubemap", Cube) = "_Skybox" {}
        _CubemapMip ("CubemapMip", Range(0, 7)) = 0
        _FresnelPow ("FresnelPow", Range(0, 10)) = 0
        _EnvSpecInt ("EnvSpecInt", Range(1, 5)) = 1
        _EftTex ("EftTex", 2D) = "white" {}
        _EftPow ("EftPow", Range(0, 5)) = 0.4782608
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _AO; uniform float4 _AO_ST;
            uniform samplerCUBE _Cubemap;
            uniform sampler2D _EftTex; uniform float4 _EftTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _EftPow)
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
////// Emissive:
                float4 _EftTex_var = tex2D(_EftTex,TRANSFORM_TEX(i.uv0, _EftTex));
                float _EftPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EftPow );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 node_6681 = (lightDirection*(-1.0));
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 node_1226 = mul( _Normal_var.rgb, tangentTransform ).xyz;
                float node_5103 = saturate(dot(node_6681,node_1226.rgb));
                float node_5008 = dot(reflect(node_6681,node_1226.rgb),viewDirection); //  Phong
                float node_797 = saturate(node_5008);
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float3 node_8101 = ((_MainTex_var.rgb*node_5103)+pow(node_797,_SpecPow_var));
                float4 _AO_var = tex2D(_AO,TRANSFORM_TEX(i.uv0, _AO));
                float3 node_8487 = reflect((viewDirection*(-1.0)),node_1226.rgb);
                float _CubemapMip_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubemapMip );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 node_12 = ((texCUBElod(_Cubemap,float4(node_8487,_CubemapMip_var)).rgb*pow(1.0-max(0,dot(node_1226.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var);
                float3 emissive = ((_EftTex_var.rgb*_EftPow_var)+(node_8101+(_AO_var.rgb*node_12)));
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _AO; uniform float4 _AO_ST;
            uniform samplerCUBE _Cubemap;
            uniform sampler2D _EftTex; uniform float4 _EftTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _EftPow)
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
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
