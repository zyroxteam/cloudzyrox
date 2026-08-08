#!/usr/bin/env bash
set -m
cd "$(dirname "$0")"
pkill -f "node server.js" 2>/dev/null; sleep 1

export PUTER_TOKEN=$(grep '^PUTER_TOKEN=' /home/user/GLM-4.5/mobile/.env | cut -d'=' -f2-)
export ACCESS_TOKEN=toxic
export DEFAULT_MODEL=z-ai/glm-4.6
export DASHBOARD_OPEN=1
export PORT=10000
echo "Token length: ${#PUTER_TOKEN}"

nohup node server.js > /tmp/zyrox_node.log 2>&1 &
APP_PID=$!
sleep 3
B=http://localhost:10000

echo ""; echo "=== 1) Dashboard (/) ==="
curl -s --max-time 10 "$B/" -o /tmp/zyroxdash.html -w "HTTP %{http_code}, %{size_download} bytes\n"
grep -o "ZyroxZlm" /tmp/zyroxdash.html | head -1
grep -o "Active Models" /tmp/zyroxdash.html | head -1

echo ""; echo "=== 2) /api/stats (config aaya?) ==="
curl -s --max-time 10 "$B/api/stats" | python3 -c "import sys,json;d=json.load(sys.stdin);print('total:',d['total_requests'],'| today:',d['requests_today'],'| models:',len(d['per_model']),'| default:',d['config']['default_model'])"

echo ""; echo "=== 3) Ping glm-4.6 ==="
curl -s --max-time 70 "$B/api/ping?model=z-ai/glm-4.6" | python3 -c "import sys,json;d=json.load(sys.stdin);print('status:',d['status'],'| latency:',d.get('latency_ms'),'ms')"

echo ""; echo "=== 4) Chat (tracks usage) ==="
curl -s --max-time 75 -X POST "$B/v1/chat/completions" \
  -H "Authorization: Bearer toxic" -H "Content-Type: application/json" \
  -d '{"model":"glm-4.6","messages":[{"role":"user","content":"1 word: hello"}]}' \
  | python3 -c "import sys,json;d=json.load(sys.stdin);print('reply:',d['choices'][0]['message']['content'][:50])"

echo ""; echo "=== 5) Stats after request ==="
curl -s --max-time 10 "$B/api/stats" | python3 -c "import sys,json;d=json.load(sys.stdin);pm=d['per_model']['z-ai/glm-4.6'];print('requests today:',d['requests_today'],'| glm-4.6 uses:',pm['uses'],'| recent:',len(d['recent']))"

echo ""; echo "=== stopping ==="; kill $APP_PID 2>/dev/null; echo "done"
