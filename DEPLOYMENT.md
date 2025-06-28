# Deployment Guide

## Render.com Deployment

### 1. Create a New Repository
1. Create a new GitHub repository
2. Upload the contents of this `chromadb-server` folder
3. Make sure to include all files except `chroma_data/` (it's in .gitignore)

### 2. Deploy on Render.com
1. Go to [Render.com](https://render.com)
2. Click "New +" → "Web Service"
3. Connect your GitHub repository
4. Configure the service:
   - **Name**: `chromadb-server` (or your preferred name)
   - **Environment**: `Docker`
   - **Build Command**: Leave empty (Docker handles this)
   - **Start Command**: Leave empty (Docker handles this)
   - **Plan**: Free (or paid for better performance)

### 3. Environment Variables
Add these environment variables in Render.com:
```
CHROMA_SERVER_HOST=0.0.0.0
CHROMA_SERVER_HTTP_PORT=8000
CHROMA_SERVER_CORS_ALLOW_ORIGINS=["*"]
```

### 4. Deploy
Click "Create Web Service" and wait for deployment.

### 5. Get Your URL
Once deployed, you'll get a URL like: `https://your-chromadb.onrender.com`

## Update Your Main Application

### 1. Update Environment Variables
In your main backend application, update the ChromaDB configuration:

```env
# Old (local)
CHROMA_HOST=localhost
CHROMA_PORT=8000

# New (Render.com)
CHROMA_HOST=your-chromadb.onrender.com
CHROMA_PORT=443
CHROMA_SSL=true
```

### 2. Test Connection
Test the connection from your main app to ensure it works.

## Alternative Platforms

### Railway
1. Connect your GitHub repository
2. Deploy as a Docker service
3. Use the provided URL

### DigitalOcean App Platform
1. Create a new app
2. Connect your GitHub repository
3. Deploy as a Docker container

### AWS ECS
1. Create an ECS cluster
2. Create a task definition using the Docker image
3. Deploy the service

## Monitoring

### Health Check
```bash
curl https://your-chromadb.onrender.com/api/v1/heartbeat
```

### Logs
- Render.com: View logs in the dashboard
- Local: `docker-compose logs -f`

### Performance
- Monitor memory usage
- Check response times
- Monitor API calls from your main app

## Troubleshooting

### Common Issues

1. **ChromaDB won't start**
   - Check Docker logs
   - Verify environment variables
   - Ensure port 8000 is available

2. **Connection timeout**
   - Check if the service is running
   - Verify the URL is correct
   - Check CORS settings

3. **Data persistence issues**
   - ChromaDB data is stored in Render.com's ephemeral storage
   - Consider using external storage for production
   - Implement regular backups

### Support
- Check Render.com documentation
- Review ChromaDB logs
- Test locally first before deploying 