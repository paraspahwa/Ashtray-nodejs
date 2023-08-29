FROM python:2.7-slim
WORKDIR /app
COPY . /app
EXPOSE 8000
CMD ["python" ,"-m", "SimpleHTTPServer"]
