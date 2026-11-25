  FROM python:3.11-silm
  WORKDIR /app
  RUN pip install --no-cache-dir flask
  COPY app.py
  EXPOSE 5000
  CMD ["python","app.py"]
