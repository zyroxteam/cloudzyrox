# ============================================
#  ZyroxZLM API — Ready-to-use curl commands
#  Host: https://zyroxzlm-1ovg.onrender.com
#  Access Token: toxic
# ============================================

# ---- 1. Simple Chat (GLM-4.6) ----
curl -X POST "https://zyroxzlm-1ovg.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"glm-4.6","messages":[{"role":"user","content":"Hello, introduce yourself."}]}'

# ---- 2. Fast model (GLM-4.7-Flash) ----
curl -X POST "https://zyroxzlm-1ovg.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"glm-4.7-flash","messages":[{"role":"user","content":"2+2 kitna hota hai?"}]}'

# ---- 3. System + User (roleplay / task) ----
curl -X POST "https://zyroxzlm-1ovg.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{
    "model":"glm-4.6",
    "messages":[
      {"role":"system","content":"Tu ek helpful coding assistant hai, Hinglish me jawab de."},
      {"role":"user","content":"Python me list reverse karne ka function de."}
    ]
  }'

# ---- 4. Streaming response (real-time) ----
curl -N -X POST "https://zyroxzlm-1ovg.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"glm-4.6","stream":true,"messages":[{"role":"user","content":"Ek chhota kahani likho."}]}'

# ---- 5. List all available models ----
curl -H "Authorization: Bearer toxic" "https://zyroxzlm-1ovg.onrender.com/v1/models"

# ---- 6. Health check ----
curl "https://zyroxzlm-1ovg.onrender.com/health"

# ---- 7. Live Dashboard (browser me kholo) ----
# https://zyroxzlm-1ovg.onrender.com
