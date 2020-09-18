// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33957,y:33069,varname:node_3138,prsc:2|emission-5245-OUT;n:type:ShaderForge.SFN_ViewVector,id:8131,x:32639,y:32774,varname:node_8131,prsc:2;n:type:ShaderForge.SFN_Vector1,id:6823,x:32639,y:32917,varname:node_6823,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:5782,x:32803,y:32839,varname:node_5782,prsc:2|A-8131-OUT,B-6823-OUT;n:type:ShaderForge.SFN_Tex2d,id:2990,x:32639,y:33024,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_2990,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8d612087e7faa7d4fa99946bae3a51e8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:4005,x:32803,y:33024,varname:node_4005,prsc:2,tffrom:2,tfto:0|IN-2990-RGB;n:type:ShaderForge.SFN_Reflect,id:2129,x:33079,y:32918,varname:node_2129,prsc:2|A-5782-OUT,B-4005-XYZ;n:type:ShaderForge.SFN_Cubemap,id:3877,x:33299,y:32993,ptovrint:False,ptlb:CubeMap,ptin:_CubeMap,varname:node_3877,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:6986e1a0680f8174f95b0285ba218c9b,pvfc:0|DIR-2129-OUT,MIP-7858-OUT;n:type:ShaderForge.SFN_Slider,id:7858,x:32937,y:33100,ptovrint:False,ptlb:CubemapMip,ptin:_CubemapMip,varname:node_7858,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Fresnel,id:3450,x:33299,y:33221,varname:node_3450,prsc:2|NRM-4005-XYZ,EXP-3679-OUT;n:type:ShaderForge.SFN_Slider,id:3679,x:32937,y:33259,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_3679,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:6034,x:33510,y:33124,varname:node_6034,prsc:2|A-3877-RGB,B-3450-OUT;n:type:ShaderForge.SFN_Slider,id:7233,x:33365,y:33392,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_7233,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.286957,max:5;n:type:ShaderForge.SFN_Multiply,id:5245,x:33709,y:33243,varname:node_5245,prsc:2|A-6034-OUT,B-7233-OUT;proporder:2990-3877-7858-3679-7233;pass:END;sub:END;*/

Shader "JSJ/L09_Cubemap" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _CubeMap ("CubeMap", Cube) = "_Skybox" {}
        _CubemapMip ("CubemapMip", Range(0, 7)) = 0
        _FresnelPow ("FresnelPow", Range(0, 10)) = 1
        _EnvSpecInt ("EnvSpecInt", Range(0, 5)) = 1.286957
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags 
            {
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
            uniform samplerCUBE _CubeMap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
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
                float3 node_4005 = mul( _NormalMap_var.rgb, tangentTransform ).xyz;
                float _CubemapMip_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubemapMip );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = ((texCUBElod(_CubeMap,float4(reflect((viewDirection*(-1.0)),node_4005.rgb),_CubemapMip_var)).rgb*pow(1.0-max(0,dot(node_4005.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
