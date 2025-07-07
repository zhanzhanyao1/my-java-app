## 重点讲解

| 阶段                | 作用                      | 详细说明                        |
    |-------------------|-------------------------|-----------------------------|
| **拉取代码**          | `actions/checkout@v3`   | 从 GitHub 拉取最新代码             |
| **安装 Java**       | `actions/setup-java@v3` | 配置正确的 Java 版本               |
| **缓存依赖**          | `actions/cache@v3`      | 缓存 Maven 依赖，提高构建速度          |
| **Maven 构建**      | `mvn clean package`     | 构建项目，生成 jar                 |
| **构建镜像**          | `docker build`          | 用 Dockerfile 生成镜像，镜像里包含 jar |
| **登录 Docker Hub** | `docker/login-action`   | 安全登录 Docker Hub             |
| **推送镜像**          | `docker push`           | 上传镜像到 Docker Hub 仓库         |
| **SSH 部署**        | `appleboy/ssh-action`   | 远程执行部署脚本：拉取镜像，停止旧容器，启动新容器   |

## 几点最佳实践

- Secrets 里存密钥和令牌，绝不要写在代码里！
- 用缓存提升 Maven 构建速度，否则每次构建都很慢。
- 镜像打 tag 可用版本号、commit id，方便回滚和追踪。
- EC2 上运行 Docker 命令需要你的用户有权限，一般 ec2-user 预装好 Docker 并能操作。
- 确保端口释放，避免启动容器失败。
- 日志查看：使用 docker logs my-java-app 来查看容器运行日志。