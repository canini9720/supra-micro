How to run Supra-micro
1.Run config
	supra-micro-config>mvn clean install
	supra-micro-config>java -jar ./target/supra-micro-config-0.0.1-SNAPSHOT.jar
	
2.Run registry
	supra-micro-registry>mvn clean install
	supra-micro-registry>java -jar ./target/supra-micro-registry-0.0.1-SNAPSHOT.jar
3.Run gateway
	supra-micro-gateway>mvn clean install
	supra-micro-gateway>java -jar ./target/supra-micro-gateway-0.0.1-SNAPSHOT.jar