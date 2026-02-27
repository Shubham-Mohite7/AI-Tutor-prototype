# Deployment Guide - AITutor

## Quick Start

### Option 1: Vercel (Frontend) + Render (Backend)

#### Step 1: Deploy Backend to Render
1. Push code to GitHub
2. Go to [Render](https://render.com)
3. Click "New +" → "Web Service"
4. Connect your GitHub repository
5. Select the `render.yaml` configuration
6. Set environment variable: `OPENROUTER_API_KEY`

#### Step 2: Deploy Frontend to Vercel
1. Install Vercel CLI: `npm i -g vercel`
2. Run: `cd src/frontend && vercel --prod`
3. Set environment variable in Vercel dashboard:
   - `NEXT_PUBLIC_API_URL`: Your Render backend URL

#### Step 3: Update CORS
In `src/backend/app/main.py`, update CORS origins:
```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://your-app.vercel.app"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

### Option 2: Vercel Full Stack (Monorepo)

#### Step 1: Update vercel.json
```json
{
  "version": 2,
  "builds": [
    {
      "src": "src/frontend/package.json",
      "use": "@vercel/next"
    }
  ],
  "routes": [
    {
      "src": "/api/(.*)",
      "dest": "/api/$1"
    }
  ]
}
```

#### Step 2: Deploy
```bash
vercel --prod
```

## Environment Variables

### Required Variables
- `OPENROUTER_API_KEY`: Your OpenRouter API key
- `NEXT_PUBLIC_API_URL`: Backend URL (for frontend)

### Where to Set
- **Render**: In service settings
- **Vercel**: In project settings

## File Structure for Deployment

```
aitutor/
├── vercel.json              # Vercel configuration
├── render.yaml             # Render configuration
├── src/
│   ├── backend/            # FastAPI backend
│   └── frontend/           # Next.js frontend
└── deployment/             # Deployment guides
    ├── vercel-deployment.md
    └── render-deployment.md
```

## Health Checks

### Backend Health Endpoint
- URL: `/api/v1/tutor/health`
- Response: `{"status":"ok"}`

### Frontend Build
- Next.js automatically handles build optimization
- Static files served from CDN

## Troubleshooting

### Common Issues
1. **CORS Errors**: Update allowed origins
2. **API Key Missing**: Set environment variables
3. **Build Failures**: Check Python/Node versions
4. **Connection Issues**: Verify URLs and ports

### Logs
- **Render**: Dashboard → Logs
- **Vercel**: Dashboard → Functions → Logs

## Production URLs

After deployment:
- Frontend: https://your-app.vercel.app
- Backend: https://your-backend.onrender.com
- API: https://your-backend.onrender.com/api/v1/tutor/
