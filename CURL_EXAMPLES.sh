# ============================================
#  Zyrox Cloud Pannel — Ready-to-use curl commands
#  Host: https://cloudzyrox.onrender.com
#  Access Token: toxic
#  Total models: 23
# ============================================

# ────────────────────────────────────────────
#  ANTHROPIC CLAUDE MODELS (5)
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
#  Z-AI GLM MODELS (3)
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
#  FREE-TIER MODELS (15) — daily free window,
#  kabhi-kabhi upstream 429 de sakte hain
# ────────────────────────────────────────────

# ---- 9. DeepSeek V4 Pro ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"deepseek/deepseek-v4-pro:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 10. Kimi K2.6 ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"moonshotai/kimi-k2.6:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 11. Qwen 3.6 Plus ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"qwen/qwen3.6-plus:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 12. MiniMax M2.5 ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"minimax/minimax-m2.5:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 13. MiniMax M2.7 ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"minimax/minimax-m2.7:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 14. GPT-OSS 20B ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"openai/gpt-oss-20b:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 15. Gemma 4 26B ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"google/gemma-4-26b-a4b-it:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 16. Gemma 4 31B ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"google/gemma-4-31b-it:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 17. North Mini Code ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"cohere/north-mini-code:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 18. Laguna S 2.1 ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"poolside/laguna-s-2.1:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 19. Laguna XS 2.1 ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"poolside/laguna-xs-2.1:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 20. Ling 3.0 Tiny ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"inclusionai/ling-3.0-tiny:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 21. Nemotron 3 Super 120B ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"nvidia/nemotron-3-super-120b-a12b:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 22. Nemotron 3 Ultra 550B ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"nvidia/nemotron-3-ultra-550b-a55b:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ---- 23. Nemotron 3 Nano 30B ----
curl -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"nvidia/nemotron-3-nano-30b-a3b:free","messages":[{"role":"user","content":"Hello, reply exactly: OK"}],"max_tokens":300}'

# ────────────────────────────────────────────
#  ADVANCED PATTERNS
# ────────────────────────────────────────────

# ---- System + User (roleplay / task) ----
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

# ---- Streaming response (real-time) ----
curl -N -X POST "https://cloudzyrox.onrender.com/v1/chat/completions" \
  -H "Authorization: Bearer toxic" \
  -H "Content-Type: application/json" \
  -d '{"model":"anthropic/claude-sonnet-5","stream":true,"messages":[{"role":"user","content":"Count from 1 to 5."}],"max_tokens":200}'

# ────────────────────────────────────────────
#  UTILITY ENDPOINTS
# ────────────────────────────────────────────

# ---- List all available models (23) ----
curl -H "Authorization: Bearer toxic" "https://cloudzyrox.onrender.com/v1/models"

# ---- Health check ----
curl "https://cloudzyrox.onrender.com/health"

# ---- Live Dashboard (browser me kholo) ----
# https://cloudzyrox.onrender.com
# Dashboard key: zyrox
