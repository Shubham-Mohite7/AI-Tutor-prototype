# AITutor Frontend

Next.js 14 frontend for AITutor application with TypeScript and Tailwind CSS.

## Quick Deploy to Vercel

### Prerequisites
- GitHub repository with frontend code
- Vercel account
- Backend API URL

### Deploy Steps

#### Option 1: Auto-Deploy (Recommended)
1. Push frontend code to GitHub
2. Go to [Vercel](https://vercel.com)
3. Click "New Project"
4. Connect your GitHub repository
5. Select the frontend folder/repository
6. Use the `vercel.json` configuration
7. Set environment variable: `NEXT_PUBLIC_API_URL`
8. Click "Deploy"

#### Option 2: Manual Deploy
1. Install Vercel CLI: `npm i -g vercel`
2. Run from frontend directory: `vercel --prod`
3. Set environment variable in Vercel dashboard:
   - `NEXT_PUBLIC_API_URL`: Your backend URL

### Environment Variables
Set in Vercel dashboard:
- `NEXT_PUBLIC_API_URL`: Your backend API URL (e.g., https://aitutor-backend.onrender.com)

### Local Development
```bash
# Install dependencies
npm install

# Run development server
npm run dev

# Build for production
npm run build
```

### Features
- Topic input with AI-powered explanations
- Three quiz modes: Standard, Adaptive, Swipe Cards
- Responsive design for mobile and desktop
- Real-time scoring and feedback
- Professional emoji-free UI

### Production URL
After deployment: `https://aitutor-frontend.vercel.app`

### Configuration
The `vercel.json` file includes:
- Next.js build optimization
- API routing configuration
- Environment variable setup

### Browser Support
- Chrome 120+
- Firefox 121+
- Safari 17+
- Edge 120+
