FROM python:3.10-alpine

WORKDIR /app

# Upgrade core package installer
RUN pip install --no-cache-dir --upgrade pip

# Install Flask directly
RUN pip install --no-cache-dir flask

# Copy source code
COPY src/ .

EXPOSE 5000

CMD ["python", "app.py"]
