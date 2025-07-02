下面是一个更详细的步骤指南，用于设置一个使用GitHub Actions、Docker、Prometheus、Terraform和AWS EC2的简单DevOps演示项目。我们将从基础环境准备开始，并逐步实现项目的构建、部署和监控。

### 先决条件

确保已安装并配置好以下软件和服务：

- Docker
- Terraform
- AWS CLI 并配置了有效的凭证
- GitHub账号
- AWS账号

### 开始项目

#### 1. AWS EC2实例设置

我们使用Terraform来实现自动化的AWS EC2实例创建。

##### 创建Terraform脚本

在你的项目目录创建一个`terraform`目录，创建以下文件：

- `provider.tf`:
  ```hcl
  provider "aws" {
    region = "us-east-1"
  }
  ```

- `main.tf`:
  ```hcl
  resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0" # 可通过AWS EC2控制台或CLI获得
    instance_type = "t2.micro"

    tags = {
      Name = "MyJavaAppInstance"
    }
  }
  ```

##### 初始化并应用Terraform配置

运行以下命令：

```bash
cd terraform
terraform init
terraform apply
```

这将为你的应用程序生成一个新的EC2实例。记录下公共IP地址用于后续步骤。

#### 2. Docker化Java应用

确保你的项目根目录中包含Dockerfile，并按照以下步骤进行操作：

- 确保Dockerfile内容如下，并且在项目根目录：

  ```dockerfile
  FROM maven:3.8.5-openjdk-17

  WORKDIR /app

  COPY . .

  RUN mvn clean install

  CMD ["java", "-jar", "target/my-java-app-1.0-SNAPSHOT.jar"]
  ```

- 构建Docker镜像并推送到Docker Hub：

  ```bash
  docker login # 登录Docker Hub

  docker build -t yourdockerhubusername/my-java-app:latest . # 构建镜像

  docker push yourdockerhubusername/my-java-app:latest # 推送镜像
  ```

#### 3. 设置GitHub Actions

在你的项目中创建一个`.github/workflows`目录，并在其中创建 `ci.yml`：

```yaml
name: Java CI with Maven

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up JDK 17
      uses: actions/setup-java@v2
      with:
        java-version: '17'

    - name: Build with Maven
      run: mvn clean install

    - name: Build Docker Image
      run: docker build -t yourdockerhubusername/my-java-app:latest .

    - name: Log in to Docker Hub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_HUB_USERNAME }}
        password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}

    - name: Push Docker Image
      run: docker push yourdockerhubusername/my-java-app:latest
```

确保在GitHub仓库的Settings > Secrets中添加`DOCKER_HUB_USERNAME`和`DOCKER_HUB_ACCESS_TOKEN`。

#### 4. 配置和运行Docker容器

在AWS EC2实例上安装Docker并运行容器：

- SSH到你的EC2实例：

  ```bash
  ssh -i /path/to/your-key.pem ec2-user@your-ec2-public-ip
  ```

- 安装Docker：

  ```bash
  # 更新软件包
  sudo yum update -y
  
  # 安装Docker
  sudo yum install docker -y
  
  # 启动Docker服务
  sudo service docker start
  
  # 添加当前用户到docker组（需要重新登录以生效）
  sudo usermod -a -G docker ec2-user
  
  # 检查Docker版本以验证已安装
  docker --version
  ```

- 拉取并运行你的Java应用的Docker镜像：

  ```bash
  docker run -d -p 8080:8080 yourdockerhubusername/my-java-app:latest
  ```

#### 5. Prometheus监控配置

如果你的应用需要被监控，你需要确保应用暴露了指标端点，例如通过Micrometer或Prometheus Java Client库。

- 拉取并运行Prometheus：

  ```bash
  docker run -d -p 9090:9090 --name prometheus prom/prometheus
  ```

- 配置Prometheus以抓取应用的性能数据。例如，编辑`prometheus.yml`配置文件：

  ```yaml
  scrape_configs:
    - job_name: 'my-java-app'
      static_configs:
        - targets: ['localhost:8080'] # 目标设置为Java应用的端点
  ```

你可能需要将此配置文件添加到Prometheus容器并重启以应用配置。

#### 6. 验证

- 通过浏览器访问 `http://your-ec2-public-ip:8080` 确认Java应用是否正常运行。
- 通过浏览器访问 `http://your-ec2-public-ip:9090` 访问Prometheus仪表盘，确保指标数据正常收集。

以上是一个初步的DevOps项目设置指南，能够帮助你建立一个基本的流程。在实际操作中，需根据具体情况对某些步骤进行调整和故障排除。若遇到问题，建议查看相关的日志和错误信息以获取更多线索。