# Deployment Checklist - AITutor

## Pre-Deployment Checklist

### Environment Variables
- [ ] `OPENROUTER_API_KEY` set in Render dashboard
- [ ] `NEXT_PUBLIC_API_URL` set in Vercel dashboard
- [ ] Local `.env.local` created from `.env.example`

### Code Readiness
- [ ] All code committed to Git
- [ ] No hardcoded secrets in code
- [ ] CORS origins updated for production
- [ ] Health check endpoint working

### Platform Setup
- [ ] Render account created and GitHub connected
- [ ] Vercel account created and GitHub connected
- [ ] Deployment scripts executable (`chmod +x`)

---

## Deployment Steps

### Option 1: Quick Deploy
```bash
./deployment/deploy-full.sh
```

### Option 2: Manual Deploy

#### Backend (Render)
1. Push to GitHub
2. Connect repo to Render
3. Select `render.yaml` configuration
4. Set environment variables
5. Deploy

#### Frontend (Vercel)
1. Push to GitHub
2. Connect repo to Vercel
3. Set environment variables
4. Deploy

---

## Post-Deployment Verification

### Health Checks
- [ ] Backend health: `https://your-backend.onrender.com/api/v1/tutor/health`
- [ ] Frontend loads: `https://your-app.vercel.app`
- [ ] API communication working

### Functionality Testing
- [ ] Can enter topic and generate explanation
- [ ] All three quiz modes working
- [ ] Swipe cards functionality
- [ ] Score calculation
- [ ] Responsive design on mobile

### Environment Variables Check
- [ ] Backend API key accessible
- [ ] Frontend API URL correct
- [ ] No console errors

---

## Production URLs

After successful deployment:
- **Frontend**: https://your-app.vercel.app
- **Backend**: https://your-backend.onrender.com
- **API Docs**: https://your-backend.onrender.com/docs

---

## Troubleshooting

### Common Issues
1. **CORS Error**: Update allowed origins in backend
2. **API Key Error**: Check environment variables
3. **Build Failure**: Verify Python/Node versions
4. **Connection Timeout**: Check API URLs

### Rollback
```bash
# Rollback to previous commit
git revert HEAD~1
./deployment/deploy-full.sh
```

---

## Monitoring

### Logs
- **Render**: Dashboard → Services → Your Service → Logs
- **Vercel**: Dashboard → Projects → Your Project → Functions → Logs

### Performance
- Monitor response times
- Check error rates
- Verify uptime

---

## Success Criteria

- [ ] Both services deployed successfully
- [ ] All core features working
- [ ] No critical errors in logs
- [ ] Performance acceptable (< 3s load time)
- [ ] Mobile responsive design working

**Ready for production use!**
