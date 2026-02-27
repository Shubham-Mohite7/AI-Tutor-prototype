# Production Deployment Scripts

## Vercel Deployment Script
```bash
#!/bin/bash
echo "Deploying to Vercel..."
cd src/frontend
vercel --prod
echo "Frontend deployed to Vercel!"
```

## Render Deployment Script
```bash
#!/bin/bash
echo "Deploying to Render..."
git push origin main
echo "Backend deployed to Render!"
```

## Full Deployment Script
```bash
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
```

## Usage
```bash
# Make scripts executable
chmod +x deployment/deploy-vercel.sh
chmod +x deployment/deploy-render.sh
chmod +x deployment/deploy-full.sh

# Run deployment
./deployment/deploy-full.sh
```
