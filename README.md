# AITutor — Production-Ready Web App

Tutor for Indian students. Enter any topic, get a clear explanation, then take a 10-question mock test grounded in that explanation.

## Tech Stack

| Layer     | Technology                              |
|-----------|-----------------------------------------|
| Frontend  | Next.js 14 (App Router), TypeScript, Tailwind CSS |
| Backend   | FastAPI, Python 3.12, Pydantic v2       |
| API        | OpenRouter → GPT-OSS 120B (deep reasoning) |
| Deploy    | Docker + docker-compose                 |

## Project Structure

```
aitutor/
├── src/
│   ├── backend/
│   │   ├── app/
│   │   │   ├── core/config.py          # Settings (pydantic-settings)
│   │   │   ├── models/schemas.py       # Request/response Pydantic models
│   │   │   ├── services/api_service.py  # All API logic isolated here
│   │   │   ├── api/routes/tutor.py     # FastAPI route handlers
│   │   │   └── main.py                 # App factory + middleware
│   │   ├── requirements.txt
│   │   ├── Dockerfile
│   │   └── .env.example
│   └── frontend/
│       ├── app/
│       │   ├── components/
│       │   │   ├── layout/             # Navbar, Hero
│       │   │   ├── ui/                 # Card, Button (reusable)
│       │   │   └── tutor/              # TutorApp, TopicInput, QuizView, etc.
│       │   ├── hooks/useLearn.ts       # All client state + API calls
│       │   ├── lib/api.ts              # Typed fetch wrapper
│       │   ├── types/index.ts          # Shared TypeScript types
│       │   ├── layout.tsx
│       │   └── page.tsx
│       ├── public/manifest.json
│       ├── tailwind.config.ts
│       ├── next.config.mjs
│       └── Dockerfile
├── deployment/                     # Deployment configurations
├── docs/                          # Documentation
├── vercel.json                    # Vercel configuration
├── render.yaml                    # Render configuration
└── DEPLOYMENT.md                  # Deployment guide
```

## Quick Start (Local Dev)

### Option 1: Using Modular Structure (Recommended)
```bash
# Backend
cd backend
cp .env.example .env
# Edit .env with your OPENROUTER_API_KEY
python -m uvicorn app.main:app --reload --port 8000

# Frontend (new terminal)
cd frontend
cp .env.example .env.local
npm install
npm run dev
```

### Option 2: Using Original Structure
```bash
# Backend
cd src/backend
source venv/bin/activate
python -m uvicorn app.main:app --reload --port 8000

# Frontend
cd src/frontend
npm install
npm run dev
```

### 3. Open Browser
Navigate to: http://localhost:3000 (or 3001/3002 if ports taken)

---

## Production Deployment

### 🚀 Quick Deploy (Modular Structure)
```bash
# Deploy both services
cd backend && ./deploy.sh
cd ../frontend && ./deploy.sh
```

### Option 1: Separate Modules (Recommended)
- **Backend**: See [backend/README.md](backend/README.md) → Deploy to Render
- **Frontend**: See [frontend/README.md](frontend/README.md) → Deploy to Vercel
- **Guide**: See [QUICK_DEPLOY.md](QUICK_DEPLOY.md) for step-by-step

### Option 2: Original Structure
- See [DEPLOYMENT.md](DEPLOYMENT.md) for combined deployment

### Option 3: Full Modular Setup
- See [MODULAR_DEPLOYMENT.md](MODULAR_DEPLOYMENT.md) for complete guide

---

## Docker (Production)

```bash
# Set your API key in src/backend/.env first
docker-compose up --build
```

Frontend → http://localhost:3000  
Backend API docs → http://localhost:8000/docs

## API Endpoints

| Method | Path                    | Description                          |
|--------|-------------------------|--------------------------------------|
| POST   | /api/v1/tutor/learn     | Generate explanation + quiz (30-60s) |
| POST   | /api/v1/tutor/score     | Score quiz answers (instant)         |
| GET    | /api/v1/tutor/health    | Health check                         |
| GET    | /docs                   | Swagger UI                           |

### POST /api/v1/tutor/learn
```json
{ "topic": "Photosynthesis", "language": "en" }
```

**Response:**
```json
{
  "topic": "Photosynthesis",
  "explanation": "Photosynthesis is the process by which...",
  "quiz": [
    {
      "question": "According to the explanation...",
      "options": ["A) ...", "B) ...", "C) ...", "D) ..."],
      "answer": 0,
      "explanation": "...",
      "difficulty": 1
    }
  ]
}
```

## Environment Variables

Create `.env.local` from `.env.example`:

```bash
# Required
OPENROUTER_API_KEY=sk-or-v1-your-key-here
NEXT_PUBLIC_API_URL=http://localhost:8000

# Optional
NODE_ENV=development
```

## Development

### Code Quality
- TypeScript strict mode
- ESLint + Prettier
- Pre-commit hooks
- Docker support

### Testing
```bash
# Backend tests
cd src/backend && python -m pytest

# Frontend tests
cd src/frontend && npm test
```

## Production Features

- Production-ready code
- Environment-based configuration
- Health checks
- Error handling
- CORS support
- Docker deployment
- Vercel + Render deployment guides
- Emoji-free UI (professional)
- Responsive design
- Three quiz modes (Standard, Adaptive, Swipe Cards)

## License

MIT License - see [LICENSE](LICENSE) for details.
