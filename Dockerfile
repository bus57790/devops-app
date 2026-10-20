FROM python:3.10-alpine

WORKDIR /app

# Upgrade pre-installed Python build utilities and core libraries
RUN pip install --no-cache-dir --upgrade \
    pip \
    "setuptools>=84.2.0" \
    "wheel>=0.48.0" \
    "msgpack>=1.2.1" \
    "urllib3>=2.8.0"

# Install application frameworks
RUN pip install --no-cache-dir flask

# Copy source code
COPY src/ .

EXPOSE 5000

CMD ["python", "app.py"]
