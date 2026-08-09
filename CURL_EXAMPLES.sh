# ============================================
#  Zyrox Cloud Pannel — Ready-to-use curl commands
#  Host: https://cloudzyrox.onrender.com
#  Access Token: toxic
# ============================================

# ────────────────────────────────────────────
#  ANTHROPIC CLAUDE MODELS
# ────────────────────────────────────────────

# ---- 1. Claude Haiku 4.5 (fast + cheap) ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"anthropic/claude-haiku-4-5","messages":[{"role":"user","content":"Hello, introduce yourself in one line."}],"max_tokens":200}'

# ---- 2. Claude Sonnet 5 (default flagship) ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"anthropic/claude-sonnet-5","messages":[{"role":"user","content":"Hello, reply exactly: API working"}],"max_tokens":50}'

# ---- 3. Claude Opus 4.8 (heavy reasoning) ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"anthropic/claude-opus-4-8","messages":[{"role":"user","content":"Explain recursion in 2 lines."}],"max_tokens":500}'

# ---- 4. Claude Opus 5 (top-tier) ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"anthropic/claude-opus-5","messages":[{"role":"user","content":"Write a 4-line poem about coding."}],"max_tokens":500}'

# ---- 5. Claude Fable 5 (storytelling) ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"anthropic/claude-fable-5","messages":[{"role":"user","content":"Ek chhoti si kahani sunao."}],"max_tokens":500}'

# ────────────────────────────────────────────
#  Z-AI GLM MODELS
# ────────────────────────────────────────────

# ---- 6. GLM 4.7 ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"z-ai/glm-4.7","messages":[{"role":"user","content":"2+2 kitna hota hai?"}],"max_tokens":300}'

# ---- 7. GLM 4.6 ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"z-ai/glm-4.6","messages":[{"role":"user","content":"Hello, reply exactly: API working"}],"max_tokens":300}'

# ---- 8. GLM 4.5 ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"z-ai/glm-4.5","messages":[{"role":"user","content":"Python me list reverse karne ka one-liner de."}],"max_tokens":300}'

# ────────────────────────────────────────────
#  ADVANCED PATTERNS
# ────────────────────────────────────────────

# ---- 9. System + User (roleplay / task) ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{
    "model":"anthropic/claude-sonnet-5",
    "messages":[
      {"role":"system","content":"Tu ek helpful coding assistant hai, Hinglish me jawab de."},
      {"role":"user","content":"Python me fibonacci function likh."}
    ],
    "max_tokens":800
  }'

# ---- 10. Streaming response (real-time) ----
curl -N -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"anthropic/claude-sonnet-5","stream":true,"messages":[{"role":"user","content":"Count from 1 to 5."}],"max_tokens":200}'

# ────────────────────────────────────────────
#  UTILITY ENDPOINTS
# ────────────────────────────────────────────

# ---- 11. List all available models ----
curl -H "Authorization: Bearer toxic" "https://cloudzyrox.onrender.com/v1/models"

# ---- 12. Health check ----
curl "https://cloudzyrox.onrender.com/health"

# ---- 13. Live Dashboard (browser me kholo) ----
# https://cloudzyrox.onrender.com
# Dashboard key: zyrox
