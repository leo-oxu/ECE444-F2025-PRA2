FROM python:3.12-slim

WORKDIR /app

# Install deps first (cache-friendly)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your code
COPY . .

# App listens on 8000 (match your CMD)
EXPOSE 5000

# Start with Gunicorn; change app:app if your module/instance differ
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "activity1_4:app"]
