# AITutor - Easy Deployment Structure

## 🎯 Project Overview

Your AITutor application has been restructured for **easy deployment** with separate frontend and backend modules.

## 📁 New Structure

```
aitutor/
├── backend/              # 🐍 FastAPI Backend (Deploy to Render)
│   ├── app/             # Application code
│   ├── requirements.txt  # Python dependencies
│   ├── render.yaml      # Render configuration
│   ├── .env.example     # Environment template
│   ├── deploy.sh        # One-command deployment
│   └── README.md        # Backend deployment guide
│
├── frontend/            # 🌐 Next.js Frontend (Deploy to Vercel)
│   ├── app/             # React components
│   ├── package.json     # Node.js dependencies
│   ├── vercel.json      # Vercel configuration
│   ├── .env.example     # Environment template
│   ├── deploy.sh        # One-command deployment
│   └── README.md        # Frontend deployment guide
│
├── src/                 # Original structure (still works)
├── deployment/          # Additional deployment tools
├── docs/               # Documentation
└── README.md           # Main project guide
```

## 🚀 Super Quick Deployment

### 1. Backend to Render
```bash
cd backend
cp .env.example .env
# Add your OPENROUTER_API_KEY to .env
./deploy.sh
```

### 2. Frontend to Vercel
```bash
cd frontend
cp .env.example .env.local
# Add your backend URL to .env.local
./deploy.sh
```

## ✨ Benefits

- **🔥 One-command deployment**: `./deploy.sh` in each module
- **🚀 Independent services**: Deploy frontend/backend separately
- **⚡ Faster builds**: Smaller codebases
- **👥 Team collaboration**: Frontend/backend teams work independently
- **📱 Separate scaling**: Scale services independently
- **🛠 Easy maintenance**: Update one service without affecting other

## 🌐 Production URLs

After deployment:
- **Backend**: https://aitutor-backend.onrender.com
- **Frontend**: https://aitutor-frontend.vercel.app
- **API Docs**: https://aitutor-backend.onrender.com/docs

## 📚 Documentation

- **[QUICK_DEPLOY.md](QUICK_DEPLOY.md)**: Step-by-step deployment
- **[MODULAR_DEPLOYMENT.md](MODULAR_DEPLOYMENT.md)**: Complete modular guide
- **[backend/README.md](backend/README.md)**: Backend-specific guide
- **[frontend/README.md](frontend/README.md)**: Frontend-specific guide

## 🔧 Environment Variables

### Backend (.env)
```bash
OPENROUTER_API_KEY=sk-or-v1-your-key-here
PORT=8000
NODE_ENV=production
```

### Frontend (.env.local)
```bash
NEXT_PUBLIC_API_URL=https://aitutor-backend.onrender.com
NODE_ENV=production
```

## ✅ Ready to Deploy!

**Both modules are production-ready with:**
- ✅ Deployment configurations
- ✅ Environment variable templates
- ✅ One-command deploy scripts
- ✅ Individual README guides
- ✅ Health checks
- ✅ Error handling

**Choose your deployment option and deploy in minutes!** 🎉
