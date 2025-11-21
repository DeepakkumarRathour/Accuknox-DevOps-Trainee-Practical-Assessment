FROM debian:12-slim
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Copy script
COPY wisecow.sh /app/wisecow.sh

# Convert CRLF to LF inside container just to be safe
RUN sed -i 's/\r$//' /app/wisecow.sh && chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["bash", "/app/wisecow.sh"]
