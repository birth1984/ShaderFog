// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33465,y:32709,varname:node_3138,prsc:2|emission-6246-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32517,y:32953,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Vector4Property,id:2553,x:32520,y:32460,ptovrint:False,ptlb:OneVector：伪造光方向,ptin:_OneVector,varname:node_2553,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:1,v3:0,v4:0;n:type:ShaderForge.SFN_Normalize,id:2156,x:32704,y:32460,cmnt: 伪造光,varname:node_2156,prsc:2|IN-2553-XYZ;n:type:ShaderForge.SFN_NormalVector,id:920,x:32704,y:32629,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:8465,x:32879,y:32539,varname:node_8465,prsc:2,dt:0|A-2156-OUT,B-920-OUT;n:type:ShaderForge.SFN_RemapRange,id:7965,x:33061,y:32539,cmnt: Lambert,varname:node_7965,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8465-OUT;n:type:ShaderForge.SFN_Multiply,id:157,x:32704,y:32884,cmnt:乘以颜色,varname:node_157,prsc:2|A-7965-OUT,B-7241-RGB;n:type:ShaderForge.SFN_Multiply,id:733,x:32883,y:32972,cmnt:乘以强度,varname:node_733,prsc:2|A-157-OUT,B-9225-OUT;n:type:ShaderForge.SFN_Slider,id:9225,x:32547,y:33147,ptovrint:False,ptlb:Light Power,ptin:_LightPower,cmnt: 伪造光强度,varname:node_9225,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9003609,max:2;n:type:ShaderForge.SFN_TexCoord,id:6611,x:32704,y:33244,varname:node_6611,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:2687,x:32883,y:33159,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_2687,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6611-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3129,x:33069,y:32972,varname:node_3129,prsc:2|A-733-OUT,B-2687-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:6246,x:33262,y:32811,ptovrint:False,ptlb:LightOn/Off,ptin:_LightOnOff,varname:node_6246,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-2687-RGB,B-3129-OUT;proporder:7241-2553-9225-2687-6246;pass:END;sub:END;*/

Shader "JSJ/L05_VirtualLight" {
    Properties {
        _LightColor ("LightColor", Color) = (0.07843138,0.3921569,0.7843137,1)
        _OneVector ("OneVector：伪造光方向", Vector) = (0,1,0,0)
        _LightPower ("Light Power", Range(0, 2)) = 0.9003609
        _Texture ("Texture", 2D) = "white" {}
        [MaterialToggle] _LightOnOff ("LightOn/Off", Float ) = 0
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _OneVector)
                UNITY_DEFINE_INSTANCED_PROP( float, _LightPower)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _LightOnOff)
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
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float4 _OneVector_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OneVector );
                float4 _LightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightColor );
                float _LightPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightPower ); //  伪造光强度
                float3 _LightOnOff_var = lerp( _Texture_var.rgb, ((((dot(normalize(_OneVector_var.rgb),i.normalDir)*0.5+0.5)*_LightColor_var.rgb)*_LightPower_var)*_Texture_var.rgb), UNITY_ACCESS_INSTANCED_PROP( Props, _LightOnOff ) );
                float3 emissive = _LightOnOff_var;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
