FROM python:3.10-slim

WORKDIR /app

# Upgrade core build tools to patched versions
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ .

EXPOSE 5000

CMD ["python", "app.py"]
