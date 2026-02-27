#!/bin/bash

echo "Deploying AITutor Backend to Render..."

# Check if we're in the right directory
if [ ! -f "requirements.txt" ]; then
    echo "Error: requirements.txt not found. Please run from backend directory."
    exit 1
fi

# Add all changes
git add .

# Commit changes
git commit -m "Deploy backend to production - $(date)"

# Push to GitHub
git push origin main

echo "✅ Backend deployed to Render!"
echo "📊 Monitor at: https://dashboard.render.com"
echo "🔗 Backend URL: https://aitutor-backend.onrender.com"
echo "📚 API Docs: https://aitutor-backend.onrender.com/docs"
