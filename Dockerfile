FROM python:3.10-alpine

WORKDIR /app

# Force reinstall and overwrite system-bundled legacy packages
RUN pip install --no-cache-dir --upgrade --ignore-installed \
    pip \
    "setuptools>=84.2.0" \
    "wheel>=0.48.0" \
    "msgpack>=1.2.1" \
    "urllib3>=2.8.0"

# Install application dependencies
RUN pip install --no-cache-dir flask

# Copy application source code
COPY src/ .

EXPOSE 5000

CMD ["python", "app.py"]
