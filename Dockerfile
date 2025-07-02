# 第一阶段：使用 Maven 构建项目
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 第二阶段：构建运行时镜像
FROM openjdk:17
WORKDIR /app
COPY --from=build /app/target/my-java-app-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
