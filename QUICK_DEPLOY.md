# Modular Deployment Guide

## Quick Start - Separate Modules

### 1. Backend Module (Render)
```bash
cd backend
cp .env.example .env
# Edit .env with your OPENROUTER_API_KEY
./deploy.sh
```

### 2. Frontend Module (Vercel)
```bash
cd frontend
cp .env.example .env.local
# Edit .env.local with your backend URL
./deploy.sh
```

## Repository Setup (Optional)

### Create Separate Repositories
1. **Backend Repo**: `git clone` backend folder only
2. **Frontend Repo**: `git clone` frontend folder only
3. **Update Remotes**: Point to new repositories

### Benefits
- ✅ Independent deployment cycles
- ✅ Separate CI/CD pipelines
- ✅ Team autonomy
- ✅ Faster build times
- ✅ Isolated testing

## Production URLs

After deployment:
- **Backend**: https://aitutor-backend.onrender.com
- **Frontend**: https://aitutor-frontend.vercel.app

## Verification

1. Test backend health: `https://aitutor-backend.onrender.com/api/v1/tutor/health`
2. Test frontend: `https://aitutor-frontend.vercel.app`
3. Test API communication between services

## Rollback

```bash
# Backend rollback
cd backend
git revert HEAD~1
./deploy.sh

# Frontend rollback
cd frontend
git revert HEAD~1
./deploy.sh
```
