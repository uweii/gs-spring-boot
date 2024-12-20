# 使用官方的 Maven 镜像作为基础镜像，并在其中包含 JDK 8
FROM maven:3.8.6-openjdk-8-slim AS builder

# 设置工作目录
WORKDIR /app

# 将你的源代码复制到容器中
COPY . /app

# 在容器中执行 Maven 构建命令来生成 jar 文件
RUN mvn clean package -DskipTests

# 使用 JDK 8 作为运行时环境（精简版本）
FROM openjdk:8-jdk-alpine

# 设置工作目录
WORKDIR /app

# 从构建阶段复制生成的 jar 文件到新的镜像中
COPY --from=builder /app/target/*.jar app.jar

# 暴露容器的端口（Spring Boot 默认是 8080）
EXPOSE 8080

# 启动 Spring Boot 应用
ENTRYPOINT ["java", "-jar", "app.jar"]
