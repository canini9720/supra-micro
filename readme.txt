How to run Supra-micro
Ports:
config-service 		:8191
userProfile-service	:9191
auth-service		:8282
supra-ui			:8080 (default Port)

1.Run config
	supra-micro-config>mvn clean install
	supra-micro-config>java -jar ./target/supra-micro-config-0.0.1-SNAPSHOT.jar
	
	1.a) Check the properties file for various profile. Below examples
		http://localhost:8191/registry-service/dev
		http://localhost:8191/gateway-service/prod
		http://localhost:8191/userprofile-service/prod
		http://localhost:8191/auth-service/dev
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
			
4.Run auth-service
	supra-micro-auth>mvn clean install
	supra-micro-auth>java -jar ./target\supra-micro-auth-0.0.1-SNAPSHOT.jar
	RestAPI:
			http://localhost:8282/oauth/token
			http://localhost:8282/oauth/check_token?token=<access_token from above api>
	
5.Run supra-ui - This is used to test 'authorization-code' grant_type
	Directly run from eclipse.			
	From Browser:
		http://localhost:8080/secure