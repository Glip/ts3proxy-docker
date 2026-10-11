FROM alpine:3.20

RUN apk add --no-cache python3 py3-yaml \
    && find /usr -type d -name '__pycache__' -exec rm -rf {} + \
    && find /usr -type f -name '*.pyc' -delete

WORKDIR /ts3proxy

COPY ts3proxy/ts3proxy ./ts3proxy
COPY ts3proxy/config.example.yml ./config.yml

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

CMD ["python3", "-m", "ts3proxy"]
