FROM alpine:3
LABEL maintainer="Hi-Technix, Inc. <support@hitechnix.com>"

ARG TARGETARCH

COPY ./conf/install.sh install.sh
RUN sh install.sh && rm install.sh

ENV MYSQL_DATABASE ''
ENV MYSQL_HOST ''
ENV MYSQL_PORT 3306
ENV MYSQL_USER ''
ENV MYSQL_PASSWORD ''
ENV PGDUMP_EXTRA_OPTS ''
ENV S3_ACCESS_KEY_ID ''
ENV S3_SECRET_ACCESS_KEY ''
ENV S3_BUCKET ''
ENV S3_REGION 'us-west-1'
ENV S3_PATH 'backup'
ENV S3_ENDPOINT ''
ENV S3_S3V4 'no'
ENV SCHEDULE ''
ENV PASSPHRASE ''
ENV BACKUP_KEEP_DAYS ''

COPY ./src/run.sh run.sh
COPY ./src/env.sh env.sh
COPY ./src/backup.sh backup.sh
COPY ./src/restore.sh restore.sh

CMD ["sh", "run.sh"]
