# AITutor - Modular Deployment Structure

## Project Structure

```
aitutor/
├── backend/                    # FastAPI Backend Module
│   ├── app/
│   │   ├── core/config.py
│   │   ├── models/schemas.py
│   │   ├── services/
│   │   ├── api/routes/
│   │   └── main.py
│   ├── requirements.txt
│   ├── Dockerfile
│   ├── render.yaml           # Render deployment config
│   ├── .env.example          # Environment variables template
│   ├── deploy.sh            # Deployment script
│   └── README.md            # Backend-specific docs
│
├── frontend/                   # Next.js Frontend Module
│   ├── app/
│   │   ├── components/
│   │   ├── hooks/
│   │   ├── lib/
│   │   └── types/
│   ├── public/
│   ├── package.json
│   ├── vercel.json          # Vercel deployment config
│   ├── .env.example         # Environment variables template
│   ├── deploy.sh            # Deployment script
│   └── README.md            # Frontend-specific docs
│
├── src/                       # Original source (can be removed)
├── deployment/                 # Deployment guides and scripts
├── docs/                      # Documentation
└── README.md                  # Main project README
```

## Deployment Options

### Option 1: Separate Repositories (Recommended)
Create two separate GitHub repositories:
- `aitutor-backend` → Deploy to Render
- `aitutor-frontend` → Deploy to Vercel

### Option 2: Monorepo with Subfolders
Keep single repository but deploy from subfolders:
- Backend: Deploy `backend/` folder to Render
- Frontend: Deploy `frontend/` folder to Vercel

## Quick Deployment Commands

### Backend Deployment
```bash
cd backend
./deploy.sh
```

### Frontend Deployment
```bash
cd frontend
./deploy.sh
```

### Both Services (from root)
```bash
# Deploy backend
cd backend && ./deploy.sh

# Deploy frontend
cd ../frontend && ./deploy.sh
```

## Environment Setup

### Backend Environment Variables
- `OPENROUTER_API_KEY`: OpenRouter API key
- `PORT`: 8000 (Render sets automatically)
- `NODE_ENV`: production

### Frontend Environment Variables
- `NEXT_PUBLIC_API_URL`: Backend URL
- `NODE_ENV`: production

## URLs After Deployment

- **Backend**: https://aitutor-backend.onrender.com
- **Frontend**: https://aitutor-frontend.vercel.app
- **API Docs**: https://aitutor-backend.onrender.com/docs

## Benefits of Modular Structure

1. **Independent Deployment**: Deploy frontend/backend separately
2. **Faster Builds**: Smaller codebases build faster
3. **Team Collaboration**: Frontend/backend teams can work independently
4. **Scaling**: Scale services independently
5. **Maintenance**: Update one service without affecting the other
6. **Testing**: Test services in isolation

## Migration from Current Structure

If migrating from the current `src/` structure:

1. Copy `src/backend/` to `backend/`
2. Copy `src/frontend/` to `frontend/`
3. Update deployment configurations
4. Create separate repositories (optional)
5. Update CI/CD pipelines

## CI/CD Integration

### GitHub Actions (Backend)
```yaml
name: Deploy Backend
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to Render
        run: curl -X POST https://api.render.com/v1/services/${{RENDER_SERVICE_ID}}/deploys
```

### GitHub Actions (Frontend)
```yaml
name: Deploy Frontend
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.ORG_ID }}
          vercel-project-id: ${{ secrets.PROJECT_ID }}
```
