FROM python:3.10-slim

WORKDIR /app

# Upgrade core build tools and vulnerable libraries to patched versions
RUN pip install --no-cache-dir --upgrade \
    pip \
    "setuptools>=84.2.0" \
    "wheel>=0.48.0" \
    "msgpack>=1.2.1" \
    "urllib3>=2.8.0"

# Install application frameworks
RUN pip install --no-cache-dir flask

# Copy application source code
COPY src/ .

EXPOSE 5000

CMD ["python", "app.py"]
