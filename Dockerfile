FROM openjdk:8-jre-alpine

RUN addgroup -g 1001 app && \
    adduser --shell /sbin/nologin --disabled-password \
    --no-create-home --uid 1001 --ingroup app app \
	&& apk add --no-cache bash

USER app

COPY --chown=app:app SMPPSim /app

RUN chmod +x /app/startsmppsim.sh

EXPOSE 8884

EXPOSE 2775

WORKDIR /app

USER 1001

CMD ["/app/startsmppsim.sh"]
