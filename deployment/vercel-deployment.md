# Vercel Deployment Configuration

## Frontend Deployment (Next.js)

### 1. Install Vercel CLI
```bash
npm i -g vercel
```

### 2. Deploy Frontend
```bash
cd src/frontend
vercel --prod
```

### 3. Environment Variables
Set these in Vercel dashboard:
- `NEXT_PUBLIC_API_URL`: Your Render backend URL
- `OPENROUTER_API_KEY`: Your OpenRouter API key

## Backend Deployment (Render)

### 1. Create render.yaml
```yaml
services:
  - type: web
    name: aitutor-backend
    env: python
    plan: free
    buildCommand: "cd src/backend && pip install -r requirements.txt"
    startCommand: "cd src/backend && python -m uvicorn app.main:app --host 0.0.0.0 --port $PORT"
    envVars:
      - key: OPENROUTER_API_KEY
        sync: false
      - key: PYTHON_VERSION
        value: "3.12"
        sync: false
```

### 2. Deploy to Render
- Push to GitHub
- Connect GitHub to Render
- Select repository
- Render will auto-deploy

## URLs After Deployment
- Frontend: https://your-app.vercel.app
- Backend: https://your-backend.onrender.com

## CORS Configuration
Update backend CORS settings in production:
```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://your-app.vercel.app"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```
