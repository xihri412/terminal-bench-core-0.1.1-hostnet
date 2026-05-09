FROM python:3.11-slim
RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/

WORKDIR /app

COPY requirements.txt .
RUN pip install --timeout 600 --retries 20 --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]