// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34231,y:32872,varname:node_3138,prsc:2|emission-4596-OUT;n:type:ShaderForge.SFN_Color,id:4969,x:33320,y:32917,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_4969,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7,c2:0.8,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:739,x:33857,y:32867,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,varname:node_739,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8bb19723355eee8418dd1d19c33e4e01,ntxv:0,isnm:False;n:type:ShaderForge.SFN_NormalVector,id:1584,x:32422,y:33192,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:2283,x:32580,y:33192,varname:node_2283,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-1584-OUT;n:type:ShaderForge.SFN_Multiply,id:8509,x:32807,y:33459,varname:node_8509,prsc:2|A-2283-OUT,B-308-OUT;n:type:ShaderForge.SFN_Vector1,id:308,x:32580,y:33518,varname:node_308,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:8044,x:32807,y:33192,varname:node_8044,prsc:2|A-2283-OUT,B-9210-OUT;n:type:ShaderForge.SFN_Vector1,id:9210,x:32580,y:33404,varname:node_9210,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:6969,x:33003,y:33418,varname:node_6969,prsc:2|A-8509-OUT,B-9210-OUT;n:type:ShaderForge.SFN_Subtract,id:9585,x:33003,y:33264,varname:node_9585,prsc:2|A-9470-OUT,B-8044-OUT;n:type:ShaderForge.SFN_Vector1,id:9470,x:32807,y:33342,varname:node_9470,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:3076,x:33179,y:33264,varname:node_3076,prsc:2|A-9585-OUT,B-6969-OUT;n:type:ShaderForge.SFN_Color,id:7285,x:33320,y:33121,ptovrint:False,ptlb:EnvMidCol,ptin:_EnvMidCol,varname:node_7285,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.08370414,c2:0.9339623,c3:0.1537468,c4:1;n:type:ShaderForge.SFN_Color,id:3676,x:33320,y:33296,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:node_3676,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9622642,c2:0.04992881,c3:0.04992881,c4:1;n:type:ShaderForge.SFN_Multiply,id:8743,x:33499,y:32917,varname:node_8743,prsc:2|A-4969-RGB,B-8044-OUT;n:type:ShaderForge.SFN_Multiply,id:8099,x:33499,y:33296,varname:node_8099,prsc:2|A-3676-RGB,B-6969-OUT;n:type:ShaderForge.SFN_Multiply,id:5824,x:33499,y:33121,varname:node_5824,prsc:2|A-7285-RGB,B-3076-OUT;n:type:ShaderForge.SFN_Add,id:8313,x:33664,y:32917,varname:node_8313,prsc:2|A-8743-OUT,B-8099-OUT;n:type:ShaderForge.SFN_Add,id:6893,x:33868,y:33099,varname:node_6893,prsc:2|A-8313-OUT,B-5824-OUT;n:type:ShaderForge.SFN_Multiply,id:4596,x:34046,y:32972,varname:node_4596,prsc:2|A-739-RGB,B-6893-OUT;proporder:739-4969-7285-3676;pass:END;sub:END;*/

Shader "JSJ/L07_ColAmbient" {
    Properties {
        _Occlusion ("Occlusion", 2D) = "white" {}
        _EnvUpCol ("EnvUpCol", Color) = (0.7,0.8,1,1)
        _EnvMidCol ("EnvMidCol", Color) = (0.08370414,0.9339623,0.1537468,1)
        _EnvDownCol ("EnvDownCol", Color) = (0.9622642,0.04992881,0.04992881,1)
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvMidCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
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
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion));
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_2283 = i.normalDir.g;
                float node_9210 = 0.0;
                float node_8044 = max(node_2283,node_9210);
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float node_6969 = max((node_2283*(-1.0)),node_9210);
                float4 _EnvMidCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvMidCol );
                float3 emissive = (_Occlusion_var.rgb*(((_EnvUpCol_var.rgb*node_8044)+(_EnvDownCol_var.rgb*node_6969))+(_EnvMidCol_var.rgb*((1.0-node_8044)-node_6969))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
