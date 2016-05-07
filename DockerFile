# Base java:7
FROM java:7

# Add Rest Gateway jar to container
ADD src/target/example-adapter-*.jar example-adapter.jar

# Entry in json format
ENTRYPOINT ["java", "-jar", "/example-adapter.jar"]

# Expose Tomcat
EXPOSE 8080