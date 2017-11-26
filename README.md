# Unmaintained Repository

Unmaintained repository. Development moved to: https://github.com/vrk-kpa/xrd4j/tree/master/example-adapter

X-Road Adapter Example will now be actively developed by The Finnish Population Register Centre (Väestörekisterikeskus, VRK). The original X-Road Adapter Example codebase here will be kept for archive purposes.

# X-Road Adapter Example

This project provides an example implementation of a web service that's compatible with X-Road version 6.4. The implementation is based on [XRd4J](https://github.com/petkivim/xrd4j) library. The service contains a single class that
implements two services:

* ```getRandom``` : returns a random number between 1-100
* ```helloService``` : returns a hello message with the given name

Example has support for X-Road version 6.1 and 6.4 message formats.

### Try It Out

The fastest and easiest way to try out the application is to [download](https://github.com/petkivim/x-road-adapter-example/releases/download/example-adapter-0.0.4/example-adapter-0.0.4.jar) the executable jar version (```example-adapter-0.0.4.jar```) and run it: ```java -jar example-adapter-0.0.4.jar```. The application is accessible at:

```
http://localhost:8080/example-adapter-0.0.4/Endpoint
```

The WSDL description is accessible at:

```
http://localhost:8080/example-adapter-0.0.4/Endpoint?wsdl
```

### Docker

Example Adater version 0.0.4 is also available as Docker image.

```
docker run -p 8080:8080 petkivim/x-road-adapter-example
```

If you’re using Docker on Linux natively, then the web app should now be listening on port 8080 on your Docker daemon host. If http://0.0.0.0:8080 doesn’t resolve, you can also try http://localhost:8080.

On Windows use ```docker-machine ip``` command to get Docker host’s IP address.

### Software Requirements

* Java 6 or later
* Tomcat 6 or later

### Development Environment

Setting up development environment is explained in [wiki](https://github.com/petkivim/x-road-adapter-example/wiki/Setting-up-Development-Environment).

### X-Road v 6.1 Messages

By default the example works with X-Road 6.4 messages. Use maven profile "xroad-6.1" to build the example so that it uses X-Road 6.1 messages:

```
mvn clean install -Pxroad-6.1
```
Differences are pretty small, e.g. "sdsbInstance" in 6.1 is called "xRoadInstance" in 6.4.

In addition, ```wsdl.path``` property's value (located in ```src/main/resources/xrd-servlet.properties```) must be changed to ```example.xroad-6.1.wsdl```.

### Installation

#### JAR

* Build the project and produce ```example-adapter-0.0.5-SNAPSHOT.jar``` file.
* Run the application: ```$ java -jar example-adapter-0.0.5-SNAPSHOT.jar```.

#### WAR

* Build the project and produce ```example-adapter-0.0.5-SNAPSHOT.war``` file.
* Copy the file ```tomcat.home/webapps``` folder.
* Start/restart Tomcat.

### Access the application

After installation (both JAR and WAR) the application is accessible at:

```
http://localhost:8080/example-adapter-0.0.5-SNAPSHOT/Endpoint
```

The WSDL description is accessible at:

```
http://localhost:8080/example-adapter-0.0.5-SNAPSHOT/Endpoint?wsdl
```

**N.B.** If you want to connect the services to X-Road Security Server you must update your server's IP address / host name to the WSDL file. Look for the below line and replace the default URL with your server's IP / host name.

```
<soap:address location="http://localhost:8080/example-adapter-0.0.5-SNAPSHOT/Endpoint" />
```

### Usage

Calling the service after installation when Tomcat is running.

#### getRandom

SOAP request ([v6.1](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/getRandomRequest.xml), [v6.4](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/xroad-6.4/getRandomRequest.xml)) can be found in the ```examples``` folder.

```
curl -d @getRandom.xml --header "Content-Type: text/xml" -X POST http://localhost:8080/example-adapter-0.0.5-SNAPSHOT/Endpoint
```

Example SOAP response ([v6.1](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/getRandomResponse.xml), [v6.4](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/xroad-6.4/getRandomResponse.xml)) can be found in the ```examples``` folder.

#### helloService

SOAP request ([v6.1](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/helloServiceRequest.xml),  [v6.4](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/xroad-6.4/helloServiceRequest.xml)) can be found in the ```examples``` folder.

```
curl -d @helloService.xml --header "Content-Type: text/xml" -X POST http://localhost:8080/example-adapter-0.0.5-SNAPSHOT/Endpoint
```

Example SOAP response ([v6.1](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/helloServiceResponse.xml), [v6.4](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/xroad-6.4/helloServiceResponse.xml)) can be found in the ```examples``` folder.
