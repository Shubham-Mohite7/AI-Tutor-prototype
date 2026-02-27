#!/bin/bash

echo "Starting full deployment..."

# Deploy backend to Render
echo "Step 1: Deploying backend to Render..."
git add .
git commit -m "Deploy to production"
git push origin main

# Deploy frontend to Vercel
echo "Step 2: Deploying frontend to Vercel..."
cd src/frontend
vercel --prod

echo "Deployment complete!"
echo "Frontend: https://your-app.vercel.app"
echo "Backend: https://your-backend.onrender.com"
