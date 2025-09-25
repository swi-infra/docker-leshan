FROM openjdk:17-jdk-slim

WORKDIR /app

# Install tools
RUN apt-get update && \
    apt-get install -y git maven curl && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/eclipse/leshan.git && \
    cd leshan && \
    git fetch --tags && \
    git checkout leshan-2.0.0-M17 && \
    echo "Building Leshan version: leshan-2.0.0-M17" && \
    mvn clean install -DskipTests -q

EXPOSE 5783 5784 5683 5684 8083 8084

# Start both servers with correct paths
CMD ["sh", "-c", "echo 'Starting Bootstrap Server...' && java -jar /app/leshan/leshan-demo-bsserver/target/leshan-demo-bsserver-*-jar-with-dependencies.jar --coap-host 0.0.0.0 --coap-port 5783 --coaps-port 5784 --web-host 0.0.0.0 --web-port 8083 & sleep 10 && echo 'Starting DM Server...' && java -jar /app/leshan/leshan-demo-server/target/leshan-demo-server-*-jar-with-dependencies.jar --coap-host 0.0.0.0 --coap-port 5683 --coaps-port 5684 --web-host 0.0.0.0 --web-port 8084 & echo 'Both servers started!' && tail -f /dev/null"]