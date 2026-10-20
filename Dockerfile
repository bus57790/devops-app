FROM python:3.10-slim

WORKDIR /app

RUN pip install --no-cache-dir flask

COPY src/ .

EXPOSE 5000

USER 10001

CMD ["python", "app.py"]
