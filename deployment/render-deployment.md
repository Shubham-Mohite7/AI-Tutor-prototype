# Render Deployment Configuration

## Backend Deployment

### 1. Create render.yaml
Already created at project root with:
- Python 3.12 runtime
- Auto-deployment from GitHub
- Health check endpoint
- Environment variables

### 2. Deploy Steps
1. Push code to GitHub
2. Go to Render dashboard
3. Click "New +" → "Web Service"
4. Connect GitHub repository
5. Select `render.yaml` file
6. Set environment variables:
   - `OPENROUTER_API_KEY`: Your OpenRouter API key

### 3. Environment Variables in Render
Set these in Render dashboard:
- `OPENROUTER_API_KEY`: Your OpenRouter API key
- `PYTHON_VERSION`: 3.12
- `PORT`: 8000

### 4. Health Check
Render will monitor: `/api/v1/tutor/health`

## Frontend Deployment (Vercel)

### 1. Update Environment Variables
In Vercel dashboard, set:
- `NEXT_PUBLIC_API_URL`: https://your-backend.onrender.com

### 2. CORS Update
Update backend CORS in production:
```python
# In src/backend/app/main.py
app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://your-app.vercel.app"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

## Deployment URLs
- Backend: https://your-backend.onrender.com
- Frontend: https://your-app.vercel.app

## Testing
1. Test backend health: https://your-backend.onrender.com/api/v1/tutor/health
2. Test frontend: https://your-app.vercel.app
3. Verify API communication between services
