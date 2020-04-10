How to run Supra-micro
1.Run config
	supra-micro-config>mvn clean install
	supra-micro-config>java -jar ./target/supra-micro-config-0.0.1-SNAPSHOT.jar
	
	1.a) Check the properties file for various profile. Below examples
		http://localhost:8191/registry-service/dev
		http://localhost:8191/gateway-service/prod
		http://localhost:8191/userprofile-service/prod
2.Run registry
	supra-micro-registry>mvn clean install
	supra-micro-registry>java -jar ./target/supra-micro-registry-0.0.1-SNAPSHOT.jar
3.Run gateway
	supra-micro-gateway>mvn clean install
	supra-micro-gateway>java -jar ./target/supra-micro-gateway-0.0.1-SNAPSHOT.jar
	
3.Run userprofile-service
	supra-micro-userprofile>mvn clean install
	supra-micro-userprofile>java -jar ./target\supra-micro-userprofile-0.0.1-SNAPSHOT.jar
	
	RestAPI:
			http://localhost:9191/userProfile/getEmp
			http://localhost:9191/userProfile/saveEmp
			