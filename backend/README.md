# AITutor Backend

FastAPI backend for AITutor application with OpenRouter AI integration.

## Quick Deploy to Render

### Prerequisites
- GitHub repository with backend code
- Render account
- OpenRouter API key

### Deploy Steps

#### Option 1: Auto-Deploy (Recommended)
1. Push backend code to GitHub
2. Go to [Render](https://render.com)
3. Click "New +" → "Web Service"
4. Connect your GitHub repository
5. Select the backend folder/repository
6. Use the `render.yaml` configuration
7. Set environment variable: `OPENROUTER_API_KEY`
8. Click "Create Web Service"

#### Option 2: Manual Deploy
1. Create new web service on Render
2. Set these configurations:
   - **Runtime**: Python 3.12
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `python -m uvicorn app.main:app --host 0.0.0.0 --port $PORT`
   - **Health Check**: `/api/v1/tutor/health`

### Environment Variables
Set in Render dashboard:
- `OPENROUTER_API_KEY`: Your OpenRouter API key
- `PYTHON_VERSION`: 3.12
- `PORT`: 8000

### Local Development
```bash
# Install dependencies
pip install -r requirements.txt

# Run development server
python -m uvicorn app.main:app --reload --port 8000

# Health check
curl http://localhost:8000/api/v1/tutor/health
```

### API Endpoints
- `GET /api/v1/tutor/health` - Health check
- `POST /api/v1/tutor/learn` - Generate explanation and quiz
- `POST /api/v1/tutor/score` - Score quiz answers
- `POST /api/v1/tutor/adaptive-question` - Generate adaptive questions
- `POST /api/v1/tutor/true-false` - Generate true/false statements

### Production URL
After deployment: `https://aitutor-backend.onrender.com`

### Documentation
Full API docs available at: `https://aitutor-backend.onrender.com/docs`
