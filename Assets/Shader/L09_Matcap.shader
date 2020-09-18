// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33943,y:32665,varname:node_3138,prsc:2|emission-7395-OUT;n:type:ShaderForge.SFN_Tex2d,id:9421,x:32528,y:32746,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_9421,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:199,x:32688,y:32746,varname:node_199,prsc:2,tffrom:2,tfto:3|IN-9421-RGB;n:type:ShaderForge.SFN_Transform,id:9535,x:32895,y:32574,varname:node_9535,prsc:2,tffrom:0,tfto:3|IN-199-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:6180,x:33057,y:32574,varname:node_6180,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9535-XYZ;n:type:ShaderForge.SFN_Multiply,id:7434,x:33243,y:32659,varname:node_7434,prsc:2|A-6180-OUT,B-2017-OUT;n:type:ShaderForge.SFN_Vector1,id:2017,x:33057,y:32764,varname:node_2017,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:6547,x:33413,y:32741,varname:node_6547,prsc:2|A-7434-OUT,B-2017-OUT;n:type:ShaderForge.SFN_Tex2d,id:2943,x:33580,y:32818,ptovrint:False,ptlb:Matcap,ptin:_Matcap,varname:node_2943,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6547-OUT;n:type:ShaderForge.SFN_Multiply,id:7395,x:33773,y:32914,varname:node_7395,prsc:2|A-2943-RGB,B-7612-OUT;n:type:ShaderForge.SFN_Fresnel,id:7612,x:33580,y:33021,varname:node_7612,prsc:2|NRM-199-XYZ,EXP-1890-OUT;n:type:ShaderForge.SFN_Slider,id:1890,x:33097,y:33072,ptovrint:False,ptlb:FresnellPow,ptin:_FresnellPow,varname:node_1890,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:5;n:type:ShaderForge.SFN_RemapRange,id:8405,x:32852,y:32914,varname:node_8405,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-199-XYZ;proporder:9421-2943-1890;pass:END;sub:END;*/

Shader "JSJ/L09_Matcap" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _Matcap ("Matcap", 2D) = "white" {}
        _FresnellPow ("FresnellPow", Range(1, 5)) = 1
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
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _Matcap; uniform float4 _Matcap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnellPow)
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
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 node_199 = mul( UNITY_MATRIX_V, float4(mul( _NormalMap_var.rgb, tangentTransform ),0) ).xyz;
                float node_2017 = 0.5;
                float2 node_6547 = ((mul( UNITY_MATRIX_V, float4(node_199.rgb,0) ).xyz.rgb.rg*node_2017)+node_2017);
                float4 _Matcap_var = tex2D(_Matcap,TRANSFORM_TEX(node_6547, _Matcap));
                float _FresnellPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnellPow );
                float3 emissive = (_Matcap_var.rgb*pow(1.0-max(0,dot(node_199.rgb, viewDirection)),_FresnellPow_var));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
