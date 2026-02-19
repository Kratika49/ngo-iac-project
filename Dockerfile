FROM python:3.9-slim

WORKDIR /app

# Copy everything
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run app inside app/ folder
CMD ["python", "app/app.py"]
