FROM openjdk:8-jre-alpine

RUN adduser -D -s /bin/sh app -h /usr/src/app -H

COPY --chown=app:app SMPPSim /app

RUN chmod +x /app/startsmppsim.sh

EXPOSE 8884

EXPOSE 2775

WORKDIR /app

USER app

CMD ["/app/startsmppsim.sh"]
