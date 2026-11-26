


# Use Python base image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies if requirements.txt exists
RUN pip install --no-cache-dir -r requirements.txt

# Expose application port
EXPOSE 5000

# Run application
CMD ["python", "app.py"]
