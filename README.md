# ChromaDB Server

A standalone ChromaDB server for hosting on Render.com or other cloud platforms.

## Quick Start

### Using Docker (Recommended)

1. **Clone this repository**
   ```bash
   git clone <your-repo-url>
   cd chromadb-server
   ```

2. **Start ChromaDB**
   ```bash
   docker-compose up -d
   ```

3. **Verify it's running**
   ```bash
   curl http://localhost:8000/api/v1/heartbeat
   ```

### Environment Variables

Create a `.env` file:
```env
CHROMA_SERVER_HOST=0.0.0.0
CHROMA_SERVER_HTTP_PORT=8000
CHROMA_SERVER_CORS_ALLOW_ORIGINS=["*"]
```

## Deployment on Render.com

1. **Connect your GitHub repository** to Render.com
2. **Create a new Web Service**
3. **Configure the service:**
   - **Build Command**: `docker-compose up -d`
   - **Start Command**: `docker-compose up`
   - **Environment Variables**: Add the ones from above

## API Endpoints

- **Health Check**: `GET /api/v1/heartbeat`
- **Collections**: `GET /api/v1/collections`
- **Create Collection**: `POST /api/v1/collections`
- **Add Documents**: `POST /api/v1/collections/{collection_name}/add`
- **Query**: `POST /api/v1/collections/{collection_name}/query`

## Connection from Your Main App

Update your main application's environment variables:
```env
CHROMA_HOST=your-render-chromadb-url.onrender.com
CHROMA_PORT=8000
CHROMA_SSL=false
```

## Data Persistence

ChromaDB data is stored in the `chroma_data` directory and persists between container restarts.

## Useful Commands

```bash
# Start ChromaDB
docker-compose up -d

# Stop ChromaDB
docker-compose down

# View logs
docker-compose logs -f

# Check status
docker-compose ps

# Backup data
tar -czf chroma_backup_$(date +%Y%m%d).tar.gz chroma_data/

# Restore data
tar -xzf chroma_backup_20241201.tar.gz
```

## Security Considerations

- Change default CORS settings for production
- Consider adding authentication
- Use HTTPS in production
- Restrict access to necessary IPs only 