## 1. 创建一个最基础的 Java Spring Boot Web 应用

---
```text
my-java-app/
├── pom.xml
└── src
    └── main
        ├── java
        │   └── com
        │       └── example
        │           └── App.java
        └── resources
            └── application.properties
```

## 2. 使用 Terraform 搭建 AWS EC2 环境

```
terraform/
├── provider.tf
└── main.tf
```

```
cd terraform
terraform init
terraform apply
```





## 3. 编写 Dockerfile 用于构建镜像

my-java-app/Dockerfile

## 4. GitHub Actions 实现自动构建 & 部署
1. 创建.github/workflows/ci.yml
2. 在gitHub repo中设置Secrets
```
DOCKER_HUB_USERNAME
DOCKER_HUB_ACCESS_TOKEN
EC2_HOST
EC2_SSH_KEY
```

## 5. 配置 Prometheus 实现 Java 应用监控

1. 创建prometheus.yml
```
├── prometheus/
│ └── prometheus.yml
```

2. 在pom.xml 中添加Prometheus依赖
3. 添加配置文件（src/main/resources/application.properties）
4. 创建Prometheus-deploy workflow，自动部署Prometheus 
`my-java-app/.github/workflows/prometheus-deploy.yml`


