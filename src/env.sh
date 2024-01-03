if [ -z "$S3_BUCKET" ]; then
  echo "You need to set the S3_BUCKET environment variable."
  exit 1
fi

if [ -z "$MYSQL_DATABASE" ]; then
  echo "You need to set the MYSQL_DATABASE environment variable."
  exit 1
fi

if [ -z "$MYSQL_HOST" ]; then
  # https://docs.docker.com/network/links/#environment-variables
  if [ -n "$MYSQL_PORT_3306_TCP_ADDR" ]; then
    MYSQL_HOST=$MYSQL_PORT_5432_TCP_ADDR
    MYSQL_PORT=$MYSQL_PORT_3306_TCP_PORT
  else
    echo "You need to set the MYSQL_HOST environment variable."
    exit 1
  fi
fi

if [ -z "$MYSQL_USER" ]; then
  echo "You need to set the MYSQL_USER environment variable."
  exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
  echo "You need to set the MYSQL_PASSWORD environment variable."
  exit 1
fi

if [ -z "$S3_ENDPOINT" ]; then
  aws_args=""
else
  aws_args="--endpoint-url $S3_ENDPOINT"
fi


if [ -n "$S3_ACCESS_KEY_ID" ]; then
  export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
fi
if [ -n "$S3_SECRET_ACCESS_KEY" ]; then
  export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
fi
export AWS_DEFAULT_REGION=$S3_REGION
export MSPASSWORD=$MYSQL_PASSWORD
