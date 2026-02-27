#!/bin/bash

echo "Deploying to Vercel..."
cd src/frontend
vercel --prod
echo "Frontend deployed to Vercel!"
