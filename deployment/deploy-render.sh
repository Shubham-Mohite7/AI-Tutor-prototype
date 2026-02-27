#!/bin/bash

echo "Deploying to Render..."
git add .
git commit -m "Deploy to production"
git push origin main
echo "Backend deployed to Render!"
