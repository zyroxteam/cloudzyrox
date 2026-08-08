/* Zyrox Cloud Pannel — secure OpenAI-compatible Puter proxy */
const express = require('express');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const app = express();
app.use(express.json({ limit: '2mb' }));
app.use((req,res,next)=>{
  res.setHeader('Access-Control-Allow-Origin', process.env.CORS_ORIGIN || '*');
  res.setHeader('Access-Control-Allow-Headers','Authorization, Content-Type, X-Dashboard-Key');
  res.setHeader('Access-Control-Allow-Methods','GET,POST,OPTIONS');
  if(req.method === 'OPTIONS') return res.sendStatus(204); next();
});

const PORT = process.env.PORT || 10000;
const PUTER_TOKEN = (process.env.PUTER_TOKEN || '').trim();
const ACCESS_TOKEN = (process.env.ACCESS_TOKEN || '').trim();
const DASHBOARD_KEY = (process.env.DASHBOARD_KEY || '').trim();
const DEFAULT_MODEL = process.env.DEFAULT_MODEL || 'anthropic/claude-sonnet-5';
const UPSTREAM = 'https://api.puter.com/puterai/openai/v1';
const MODELS = (process.env.MODELS || 'anthropic/claude-sonnet-5,z-ai/glm-4.7,z-ai/glm-4.6,z-ai/glm-4.5').split(',').map(id => ({id:id.trim(), tier:'Puter'}));
const FILE = path.join(__dirname, 'stats.json');
const day = () => new Date().toISOString().slice(0,10);
let stats = { date:day(), total:0, today:0, success:0, failed:0, recent:[], models:{} };
try { stats = {...stats, ...JSON.parse(fs.readFileSync(FILE,'utf8'))}; } catch (_) {}
function save(){ try { fs.writeFileSync(FILE, JSON.stringify(stats)); } catch (_) {} }
function roll(){ if(stats.date !== day()){ stats.date=day(); stats.today=0; Object.values(stats.models).forEach(m=>m.today=0); save(); } }
function auth(req){ const h=req.get('authorization')||''; const candidate=h.startsWith('Bearer ') ? h.slice(7).trim() : ''; return !ACCESS_TOKEN || (candidate.length===ACCESS_TOKEN.length && crypto.timingSafeEqual(Buffer.from(candidate),Buffer.from(ACCESS_TOKEN))); }
function dashboardAuth(req){ return !DASHBOARD_KEY || req.get('x-dashboard-key') === DASHBOARD_KEY; }
function cleanPrompt(messages=[]){ const last=[...messages].reverse().find(x=>x.role==='user'); const content = typeof last?.content==='string' ? last.content : '[multimodal]'; return content.slice(0,80).replace(/[\r\n]+/g,' '); }
function record(model, ok, ms, reqBody, status){ roll(); stats.total++; stats.today++; stats[ok?'success':'failed']++; let m=stats.models[model] ||= {total:0,today:0,success:0,failed:0,last_used:null,last_latency:null}; m.total++;m.today++;m[ok?'success':'failed']++;m.last_used=new Date().toISOString();m.last_latency=ms; stats.recent.unshift({at:m.last_used,model,ok,ms,status,prompt:cleanPrompt(reqBody.messages)});stats.recent=stats.recent.slice(0,40);save(); }

app.get('/', (_,res)=>res.sendFile(path.join(__dirname,'dashboard.html')));
app.get('/health', (_,res)=>res.json({ok:true, service:'Zyrox Cloud Pannel', configured:Boolean(PUTER_TOKEN)}));
app.get('/v1/models', (req,res)=> { if(!auth(req)) return res.status(401).json({error:{message:'Unauthorized'}}); res.json({object:'list',data:MODELS.map(x=>({id:x.id,object:'model',owned_by:'zyrox-cloud'}))}); });
app.post('/v1/chat/completions', async (req,res)=>{
  if(!auth(req)) return res.status(401).json({error:{message:'Unauthorized',type:'auth_error'}});
  if(!PUTER_TOKEN) return res.status(503).json({error:{message:'Server is not configured: PUTER_TOKEN missing',type:'configuration_error'}});
  const body={...req.body, model:req.body.model || DEFAULT_MODEL}; const began=Date.now();
  try {
    const upstream=await fetch(UPSTREAM+'/chat/completions',{method:'POST',headers:{Authorization:`Bearer ${PUTER_TOKEN}`,'Content-Type':'application/json'},body:JSON.stringify(body)});
    const ms=Date.now()-began; const type=upstream.headers.get('content-type')||'application/json';
    if(body.stream && upstream.body){ record(body.model,upstream.ok,ms,body,upstream.status); res.status(upstream.status);res.setHeader('content-type',type); return upstream.body.pipeTo(new WritableStream({write(chunk){res.write(chunk)},close(){res.end()},abort(){res.end()}})); }
    const text=await upstream.text(); record(body.model,upstream.ok,ms,body,upstream.status);res.status(upstream.status).type(type).send(text);
  } catch(e) { record(body.model,false,Date.now()-began,body,502);res.status(502).json({error:{message:'Upstream request failed',type:'upstream_error'}}); }
});
app.get('/api/dashboard', async (req,res)=>{
  if(!dashboardAuth(req)) return res.status(401).json({error:'Dashboard key required'}); roll();
  res.json({name:'ZYROX CLOUD PANNEL',configured:Boolean(PUTER_TOKEN),models:MODELS.map(x=>({...x,...(stats.models[x.id]||{total:0,today:0,success:0,failed:0,last_used:null,last_latency:null})})),stats:{total:stats.total,today:stats.today,success:stats.success,failed:stats.failed},recent:stats.recent,server_time:new Date().toISOString()});
});
app.post('/api/ping', async (req,res)=>{
  if(!dashboardAuth(req)) return res.status(401).json({error:'Dashboard key required'});
  if(!PUTER_TOKEN) return res.status(503).json({error:'PUTER_TOKEN missing'});
  const result=[]; for(const {id} of MODELS){ const t=Date.now();try{const r=await fetch(UPSTREAM+'/chat/completions',{method:'POST',headers:{Authorization:`Bearer ${PUTER_TOKEN}`,'Content-Type':'application/json'},body:JSON.stringify({model:id,messages:[{role:'user',content:'ping'}],max_tokens:1})});result.push({id,ok:r.ok,ms:Date.now()-t,status:r.status});}catch(e){result.push({id,ok:false,ms:Date.now()-t,status:0});} } res.json({result});
});
app.listen(PORT,'0.0.0.0',()=>console.log(`ZYROX CLOUD PANNEL listening on ${PORT}`));
