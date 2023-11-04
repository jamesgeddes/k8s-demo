FROM python:3.10-alpine3.18

ENV CAT_API_KEY your-api-key-here
WORKDIR /usr/src/app

COPY app.py .
COPY requirements.txt .
RUN pip install -r requirements.txt
EXPOSE 443
CMD ["python", "app.py"]
