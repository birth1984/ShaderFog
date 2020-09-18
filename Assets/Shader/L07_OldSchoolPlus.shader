// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:35014,y:32836,varname:node_3138,prsc:2|emission-7122-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:33336,y:33191,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843135,c2:0.7843137,c3:0.5254213,c4:1;n:type:ShaderForge.SFN_NormalVector,id:4317,x:33380,y:32508,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:6968,x:33380,y:32703,varname:node_6968,prsc:2;n:type:ShaderForge.SFN_Dot,id:8249,x:33553,y:32594,varname:node_8249,prsc:2,dt:0|A-4317-OUT,B-6968-OUT;n:type:ShaderForge.SFN_Max,id:847,x:33728,y:32664,varname:node_847,prsc:2|A-8249-OUT,B-3807-OUT;n:type:ShaderForge.SFN_Vector1,id:3807,x:33553,y:32746,varname:node_3807,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:6913,x:33728,y:32507,ptovrint:False,ptlb:LambertCol,ptin:_LambertCol,varname:node_6913,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:536,x:33905,y:32572,varname:node_536,prsc:2|A-6913-RGB,B-847-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:341,x:33383,y:32981,varname:node_341,prsc:2;n:type:ShaderForge.SFN_LightVector,id:2331,x:33383,y:32863,varname:node_2331,prsc:2;n:type:ShaderForge.SFN_Dot,id:6450,x:33556,y:32894,varname:node_6450,prsc:2,dt:0|A-2331-OUT,B-341-OUT;n:type:ShaderForge.SFN_Max,id:7008,x:33735,y:32965,varname:node_7008,prsc:2|A-6450-OUT,B-2421-OUT;n:type:ShaderForge.SFN_Vector1,id:2421,x:33556,y:33058,varname:node_2421,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:8119,x:33578,y:33157,ptovrint:False,ptlb:PhongPow,ptin:_PhongPow,varname:node_8119,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:5.643477,max:90;n:type:ShaderForge.SFN_Power,id:3832,x:33909,y:33055,varname:node_3832,prsc:2|VAL-7008-OUT,EXP-8119-OUT;n:type:ShaderForge.SFN_Add,id:547,x:34132,y:32746,varname:node_547,prsc:2|A-536-OUT,B-3832-OUT;n:type:ShaderForge.SFN_Color,id:928,x:34132,y:32521,ptovrint:False,ptlb:LightCol,ptin:_LightCol,cmnt: 光源颜色,varname:node_928,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7210653,c2:0.4477572,c3:0.8113208,c4:1;n:type:ShaderForge.SFN_Multiply,id:2142,x:34325,y:32614,varname:node_2142,prsc:2|A-928-RGB,B-547-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:7111,x:34325,y:32466,cmnt: 光源遮挡,varname:node_7111,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8594,x:34514,y:32545,cmnt: 光源部分综合Lambert  Phong X 光源颜色 X 光源遮挡,varname:node_8594,prsc:2|A-7111-OUT,B-2142-OUT;n:type:ShaderForge.SFN_NormalVector,id:7160,x:32346,y:33321,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:2402,x:32534,y:33321,varname:node_2402,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-7160-OUT;n:type:ShaderForge.SFN_Multiply,id:2832,x:32731,y:33715,varname:node_2832,prsc:2|A-2402-OUT,B-178-OUT;n:type:ShaderForge.SFN_Vector1,id:178,x:32534,y:33731,varname:node_178,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:2518,x:32748,y:33321,varname:node_2518,prsc:2|A-2402-OUT,B-8516-OUT;n:type:ShaderForge.SFN_Vector1,id:8516,x:32534,y:33538,varname:node_8516,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:4136,x:33519,y:33299,varname:node_4136,prsc:2|A-7241-RGB,B-2518-OUT;n:type:ShaderForge.SFN_Max,id:1479,x:32937,y:33715,varname:node_1479,prsc:2|A-8516-OUT,B-2832-OUT;n:type:ShaderForge.SFN_Color,id:8005,x:33336,y:33584,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:node_8005,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1913,x:33519,y:33696,varname:node_1913,prsc:2|A-8005-RGB,B-1479-OUT;n:type:ShaderForge.SFN_Vector1,id:1643,x:32748,y:33239,varname:node_1643,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:426,x:32933,y:33448,varname:node_426,prsc:2|A-1643-OUT,B-2518-OUT;n:type:ShaderForge.SFN_Subtract,id:7660,x:33113,y:33515,varname:node_7660,prsc:2|A-426-OUT,B-1479-OUT;n:type:ShaderForge.SFN_Multiply,id:6251,x:33519,y:33498,varname:node_6251,prsc:2|A-7814-RGB,B-7660-OUT;n:type:ShaderForge.SFN_Color,id:7814,x:33336,y:33391,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:node_7814,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Add,id:503,x:33723,y:33407,varname:node_503,prsc:2|A-4136-OUT,B-6251-OUT;n:type:ShaderForge.SFN_Add,id:9898,x:33927,y:33461,varname:node_9898,prsc:2|A-503-OUT,B-1913-OUT;n:type:ShaderForge.SFN_Multiply,id:4192,x:34128,y:33538,varname:node_4192,prsc:2|A-9898-OUT,B-607-OUT;n:type:ShaderForge.SFN_Slider,id:607,x:33770,y:33668,ptovrint:False,ptlb:EnvInt,ptin:_EnvInt,varname:node_607,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:1348,x:34332,y:33538,varname:node_1348,prsc:2|A-6913-RGB,B-4192-OUT;n:type:ShaderForge.SFN_Tex2d,id:3428,x:34332,y:33356,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,varname:node_3428,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8897,x:34539,y:33436,varname:node_8897,prsc:2|A-3428-RGB,B-1348-OUT;n:type:ShaderForge.SFN_Add,id:7122,x:34783,y:32936,varname:node_7122,prsc:2|A-8594-OUT,B-8897-OUT;proporder:6913-8119-7241-7814-8005-928-3428-607;pass:END;sub:END;*/

Shader "JSJ/L07_OldSchoolPlus" {
    Properties {
        _LambertCol ("LambertCol", Color) = (0.1,0.5,0.5,1)
        _PhongPow ("PhongPow", Range(1, 90)) = 5.643477
        _EnvUpCol ("EnvUpCol", Color) = (0.07843135,0.7843137,0.5254213,1)
        _EnvSideCol ("EnvSideCol", Color) = (0.5,0.5,0.5,1)
        _EnvDownCol ("EnvDownCol", Color) = (0.5,0.5,0.5,1)
        _LightCol ("LightCol", Color) = (0.7210653,0.4477572,0.8113208,1)
        _Occlusion ("Occlusion", 2D) = "white" {}
        _EnvInt ("EnvInt", Range(0, 1)) = 0
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
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LambertCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _PhongPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol ); //  光源颜色
                float4 _LambertCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LambertCol );
                float _PhongPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _PhongPow );
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion));
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_2402 = i.normalDir.g;
                float node_8516 = 0.0;
                float node_2518 = max(node_2402,node_8516);
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float node_1479 = max(node_8516,(node_2402*(-1.0)));
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float _EnvInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvInt );
                float3 emissive = ((attenuation*(_LightCol_var.rgb*((_LambertCol_var.rgb*max(dot(i.normalDir,lightDirection),0.0))+pow(max(dot(lightDirection,viewReflectDirection),0.0),_PhongPow_var))))+(_Occlusion_var.rgb*(_LambertCol_var.rgb*((((_EnvUpCol_var.rgb*node_2518)+(_EnvSideCol_var.rgb*((1.0-node_2518)-node_1479)))+(_EnvDownCol_var.rgb*node_1479))*_EnvInt_var))));
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
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LambertCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _PhongPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
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
