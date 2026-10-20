# --- Stage 1: Build & Dependencies ---
FROM python:3.10-alpine AS builder

WORKDIR /app

# Upgrade pip and build tools in isolation
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Install dependencies into a separate target directory
RUN pip install --no-cache-dir --target=/app/packages flask

# --- Stage 2: Minimal Runtime Image ---
FROM python:3.10-alpine

WORKDIR /app

# Copy only clean installed packages from builder
COPY --from=builder /app/packages /usr/local/lib/python3.10/site-packages
COPY src/ .

EXPOSE 5000

CMD ["python", "app.py"]
