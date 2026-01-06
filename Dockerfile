FROM alpine:latest

RUN apk add --no-cache bash

WORKDIR /app

COPY scripts/system-monitor.sh .

RUN chmod +x system-monitor.sh

CMD ["./system-monitor.sh"]
