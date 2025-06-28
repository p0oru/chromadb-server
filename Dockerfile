  FROM chromadb/chroma:latest

  EXPOSE 8000

  ENV CHROMA_SERVER_HOST=0.0.0.0
  ENV CHROMA_SERVER_HTTP_PORT=8000
  ENV CHROMA_SERVER_CORS_ALLOW_ORIGINS=["*"]
  
  CMD ["run", "--host", "0.0.0.0", "--port", "8000"]
