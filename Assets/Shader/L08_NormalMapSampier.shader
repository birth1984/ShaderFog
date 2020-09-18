// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34104,y:33028,varname:node_3138,prsc:2|emission-2080-OUT;n:type:ShaderForge.SFN_Tangent,id:4552,x:32658,y:32661,varname:node_4552,prsc:2;n:type:ShaderForge.SFN_Bitangent,id:1507,x:32658,y:32793,varname:node_1507,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:5626,x:32658,y:32925,prsc:2,pt:False;n:type:ShaderForge.SFN_Tex2dAsset,id:2113,x:32658,y:33096,ptovrint:False,ptlb:normalMap,ptin:_normalMap,varname:node_2113,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Code,id:9929,x:32911,y:32885,varname:node_9929,prsc:2,code:ZgBsAG8AYQB0ADMAIABuAEQAaQByAFQAUwAgAD0AIABVAG4AcABhAGMAawBOAG8AcgBtAGEAbAAoAHQAZQB4ADIARAAoAG4AbwByAG0AYQBsAE0AYQBwACAALAAgAHUAdgApACkAIAA7AAoAZgBsAG8AYQB0ADMAeAAzACAAVABCAE4AIAA9ACAAZgBsAG8AYQB0ADMAeAAzACgAdABEAGkAcgAgACwAIABiAEQAaQByACAALAAgAG4ARABpAHIAKQAgADsACgBmAGwAbwBhAHQAMwAgAG4ARABpAHIAVwBTACAAPQAgAG4AbwByAG0AYQBsAGkAegBlACgAbQB1AGwAKABuAEQAaQByAFQAUwAgACwAIABUAEIATgApACkAIAA7AAoAcgBlAHQAdQByAG4AIABuAEQAaQByAFcAUwAgADsA,output:2,fname:NormalMapSampier,width:683,height:215,input:2,input:2,input:2,input:12,input:1,input_1_label:tDir,input_2_label:bDir,input_3_label:nDir,input_4_label:normalMap,input_5_label:uv|A-4552-OUT,B-1507-OUT,C-5626-OUT,D-2113-TEX,E-1527-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1527,x:32658,y:33258,varname:node_1527,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_LightVector,id:8001,x:33503,y:33223,varname:node_8001,prsc:2;n:type:ShaderForge.SFN_Dot,id:9233,x:33698,y:33059,varname:node_9233,prsc:2,dt:0|A-9929-OUT,B-8001-OUT;n:type:ShaderForge.SFN_Vector1,id:1886,x:33698,y:33223,varname:node_1886,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:2080,x:33896,y:33129,varname:node_2080,prsc:2|A-9233-OUT,B-1886-OUT;proporder:2113;pass:END;sub:END;*/

Shader "JSJ/L08_NormalMapSampier" {
    Properties {
        _normalMap ("normalMap", 2D) = "bump" {}
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _normalMap; uniform float4 _normalMap_ST;
            float3 NormalMapSampier( float3 tDir , float3 bDir , float3 nDir , sampler2D normalMap , float2 uv ){
            float3 nDirTS = UnpackNormal(tex2D(normalMap , uv)) ;
            float3x3 TBN = float3x3(tDir , bDir , nDir) ;
            float3 nDirWS = normalize(mul(nDirTS , TBN)) ;
            return nDirWS ;
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float3 node_9929 = NormalMapSampier( i.tangentDir , i.bitangentDir , i.normalDir , _normalMap , i.uv0 );
                float node_2080 = max(dot(node_9929,lightDirection),0.0);
                float3 emissive = float3(node_2080,node_2080,node_2080);
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _normalMap; uniform float4 _normalMap_ST;
            float3 NormalMapSampier( float3 tDir , float3 bDir , float3 nDir , sampler2D normalMap , float2 uv ){
            float3 nDirTS = UnpackNormal(tex2D(normalMap , uv)) ;
            float3x3 TBN = float3x3(tDir , bDir , nDir) ;
            float3 nDirWS = normalize(mul(nDirTS , TBN)) ;
            return nDirWS ;
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
                i.normalDir = normalize(i.normalDir);
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
