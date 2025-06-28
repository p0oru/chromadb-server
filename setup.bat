@echo off
echo 🚀 Setting up ChromaDB Server...

REM Check if Docker is installed
docker --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker is not installed. Please install Docker first.
    echo Visit: https://docs.docker.com/get-docker/
    pause
    exit /b 1
)

REM Check if Docker Compose is installed
docker-compose --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker Compose is not installed. Please install Docker Compose first.
    echo Visit: https://docs.docker.com/compose/install/
    pause
    exit /b 1
)

REM Create chroma_data directory if it doesn't exist
if not exist "chroma_data" mkdir chroma_data

REM Start ChromaDB
echo 📦 Starting ChromaDB container...
docker-compose up -d

REM Wait for ChromaDB to be ready
echo ⏳ Waiting for ChromaDB to be ready...
timeout /t 10 /nobreak >nul

REM Test ChromaDB connection
echo 🔍 Testing ChromaDB connection...
curl -s http://localhost:8000/api/v1/heartbeat >nul 2>&1
if errorlevel 1 (
    echo ❌ ChromaDB failed to start. Check the logs:
    echo    docker-compose logs
    pause
    exit /b 1
) else (
    echo ✅ ChromaDB is running successfully!
    echo 🌐 ChromaDB is available at: http://localhost:8000
    echo.
    echo 📝 Next steps:
    echo 1. Deploy to Render.com or your preferred cloud platform
    echo 2. Update your main app's environment variables to point to this server
    echo.
    echo 🔗 Useful commands:
    echo    npm run logs    - View logs
    echo    npm run status  - Check status
    echo    npm run stop    - Stop server
)

pause 