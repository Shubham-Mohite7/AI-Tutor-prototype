#!/bin/bash

echo "Deploying AITutor Frontend to Vercel..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "Error: package.json not found. Please run from frontend directory."
    exit 1
fi

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Build the project
echo "Building frontend..."
npm run build

# Deploy to Vercel
echo "Deploying to Vercel..."
vercel --prod

echo "✅ Frontend deployed to Vercel!"
echo "🌐 Frontend URL: https://aitutor-frontend.vercel.app"
echo "🔗 Backend should be at: https://aitutor-backend.onrender.com"
