FROM debian:12-slim
WORKDIR /app

RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    bash \
    && rm -rf /var/lib/apt/lists/*

COPY wisecow.sh /app/wisecow.sh

RUN sed -i 's/\r$//' /app/wisecow.sh && chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["bash", "/app/wisecow.sh"]
