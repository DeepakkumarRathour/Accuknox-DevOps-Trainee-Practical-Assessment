FROM debian:12-slim
WORKDIR /app

RUN apt-get update && apt-get install -y \
    fortune-mod cowsay netcat-openbsd bash \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
RUN chmod +x /app/wisecow.sh

EXPOSE 4499
CMD ["bash", "wisecow.sh"]
