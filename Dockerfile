FROM python:3.10-slim

WORKDIR /app

# Upgrade core build tools to patched versions to pass Trivy
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Install dependencies directly
RUN pip install --no-cache-dir flask

# Copy source code into container
COPY src/ .

EXPOSE 5000

CMD ["python", "app.py"]
