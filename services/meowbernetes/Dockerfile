FROM python:3.10-alpine3.18

WORKDIR /usr/src/app

COPY app.py .
COPY requirements.txt .
RUN pip install -r requirements.txt
EXPOSE 8080
CMD ["python", "app.py"]
