# 第一阶段：使用 Maven 官方镜像构建项目
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# 复制全部文件到容器内
COPY . .

# 使用 Maven 打包，跳过测试，生成 jar 包
RUN mvn clean package -DskipTests

# 第二阶段：使用轻量级 OpenJDK 运行镜像
FROM openjdk:17
WORKDIR /app

# 从构建阶段复制生成的 jar 包
COPY --from=build /app/target/my-java-app-1.0-SNAPSHOT.jar app.jar

# 暴露 8080 端口，供外部访问
EXPOSE 8080

# 容器启动时执行 java -jar 运行应用
CMD ["java", "-jar", "app.jar"]
