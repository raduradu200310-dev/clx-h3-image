# CLX H3 models baked (except the 15.7 GB text encoder, pulled at boot) so the image fits CI and GPUs boot fast.
FROM vastai/comfy:v0.20.1-cuda-12.9-py312
ARG HF=https://huggingface.co
RUN set -eux; mkdir -p /baked_models/diffusion_models /baked_models/vae /baked_models/loras /baked_models/latent_upscale_models; \
 B=$HF/Comfy-Org/MiniMax-H3/resolve/main; \
 wget -q -O /baked_models/diffusion_models/minimax_h3_ref2va_pruned_int8_convrot.safetensors $B/diffusion_models/minimax_h3_ref2va_pruned_int8_convrot.safetensors; \
 wget -q -O /baked_models/vae/minimax_h3_video_vae_fp16.safetensors $B/vae/minimax_h3_video_vae_fp16.safetensors; \
 wget -q -O /baked_models/vae/minimax_h3_audio_vae_fp32.safetensors $B/vae/minimax_h3_audio_vae_fp32.safetensors; \
 wget -q -O /baked_models/loras/minimax_h3_ref2v_turbo_4step_v0.1_comfyui_bf16.safetensors $B/loras/minimax_h3_ref2v_turbo_4step_v0.1_comfyui_bf16.safetensors; \
 wget -q -O /baked_models/latent_upscale_models/minimax_h3_latent_upscaler_3d_bf16.safetensors $HF/LBH-123-AI/Minimax_h3_latent_Upscaler/resolve/main/minimax_h3_latent_upscaler_3d_conv_v1/minimax_h3_latent_upscaler_3d_conv_v1_bf16.safetensors; \
 du -sh /baked_models
