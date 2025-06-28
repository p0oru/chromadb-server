#!/bin/bash

echo "🚀 Setting up ChromaDB Server..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    echo "Visit: https://docs.docker.com/compose/install/"
    exit 1
fi

# Create chroma_data directory if it doesn't exist
mkdir -p chroma_data

# Start ChromaDB
echo "📦 Starting ChromaDB container..."
docker-compose up -d

# Wait for ChromaDB to be ready
echo "⏳ Waiting for ChromaDB to be ready..."
sleep 10

# Test ChromaDB connection
echo "🔍 Testing ChromaDB connection..."
if curl -s http://localhost:8000/api/v1/heartbeat > /dev/null; then
    echo "✅ ChromaDB is running successfully!"
    echo "🌐 ChromaDB is available at: http://localhost:8000"
    echo ""
    echo "📝 Next steps:"
    echo "1. Deploy to Render.com or your preferred cloud platform"
    echo "2. Update your main app's environment variables to point to this server"
    echo ""
    echo "🔗 Useful commands:"
    echo "   npm run logs    - View logs"
    echo "   npm run status  - Check status"
    echo "   npm run stop    - Stop server"
else
    echo "❌ ChromaDB failed to start. Check the logs:"
    echo "   docker-compose logs"
    exit 1
fi 