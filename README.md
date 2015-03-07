# X-Road Adapter Example

This project provides an example implementation of a web service that's compatible with X-Road version 6. The implementation is based on [XRd4J](https://github.com/petkivim/xrd4j) library. The service contains a single class that
implements two services:

* ```getRandom``` : returns a random number between 1-100
* ```helloService``` : returns a hello message with the given name

### Software Requirements

* Java 6 or later
* Tomcat 6 or later

### Development Environment

Setting up development environment is explained in [wiki](https://github.com/petkivim/x-road-adapter-example/wiki/Setting-up-Development-Environment).

### Installation

* Download the ```example-adapter-0.0.2.war``` file.
* Copy the file ```tomcat.home/webapps``` folder.
* Start/restart Tomcat. The application is now accessible at:

```
http://localhost:8080/example-adapter-0.0.2/Endpoint
```

The WSDL description is accessible at:

```
http://localhost:8080/example-adapter-0.0.2/Endpoint?wsdl
```

**N.B.** If you want to connect the services to X-Road Security Server you must update your server's IP address / host name to the WSDL file. Look for the below line and replace the default URL with your server's IP / host name.

```
<soap:address location="http://localhost:8080/example-adapter-0.0.2/Endpoint" />
```

### Usage

Calling the service after installation when Tomcat is running.

#### getRandom

[SOAP request](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/getRandomRequest.xml) can be found in the ```examples``` folder.

```
curl -d @getRandom.xml --header "Content-Type: text/xml" -X POST http://localhost:8080/Adapter/Endpoint
```

Example [SOAP response](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/getRandomResponse.xml) can be found in the ```examples``` folder.

#### helloService

[SOAP request](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/helloServiceRequest.xml) can be found in the ```examples``` folder.

```
curl -d @helloService.xml --header "Content-Type: text/xml" -X POST http://localhost:8080/Adapter/Endpoint
```

Example [SOAP response](https://github.com/petkivim/x-road-adapter-example/blob/master/examples/helloServiceResponse.xml) can be found in the ```examples``` folder.
