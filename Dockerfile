FROM alpine:3.5
MAINTAINER gophan1992@gmail.com
RUN \
  apk --update add openjdk7-jre curl && \
  curl -o /tmp/dynamo.tar.gz -L https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz && \
  tar xvzf /tmp/dynamo.tar.gz && \
  rm -rf third_party_licenses LICENSE.txt && \
  apk --purge del curl

EXPOSE 8000
CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "./DynamoDBLocal.jar"]