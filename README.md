## Requirements
- Java SDK 20 or higher
- Apache Maven 3.2 [https://maven.apache.org/download.cgi] or higher
- tomcat server
- Node JS v20 or higher [https://nodejs.org/en/]
- PNPM package manager [https://pnpm.io/installation]

## Installation
```shell
cd /apps/demo
pnpm install
pnpm build
cd ../../
mvn clean package
mvn spring-boot:run
```

## To run the web without apache maven or tomcat server
```shell
cd apps/demo
pnpm install
pnpm start
```
