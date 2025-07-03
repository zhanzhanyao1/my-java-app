## 什么是 Docker？
Docker 是一个轻量级的容器平台，允许开发者将应用及其依赖打包成一个可移植的镜像，并在任意地方以一致的方式运行。
## 为什么使用 Docker？
| 特性      | 说明                                   |
| ------- | ------------------------------------ |
| 一致性环境   | 开发、测试、生产环境都能运行同一个镜像，无需“它在我电脑上能跑”     |
| 易于部署与回滚 | 镜像是版本化的，部署只需 `docker run`，回滚也容易      |
| 资源隔离    | 各容器互不干扰，运行在独立的环境中                    |
| 快速启动与轻量 | 比虚拟机快得多，镜像通常以 MB 为单位                 |
| 广泛生态    | 包含大量官方和社区的基础镜像（如 Java、MySQL、Nginx 等） |

## Dockerfile 最佳实践
| 实践                     | 原因说明                                  |
| ---------------------- | ------------------------------------- |
| 使用多阶段构建                | 减少镜像体积，避免生产镜像中包含构建工具                  |
| 将容器配置（如端口、env）参数化      | 通过 `-e` 传入，便于 CI/CD 环境管理              |
| 明确命名容器                 | `--name my-java-app` 有助于重启和排查         |
| 映射端口                   | `-p 8080:8080` 把容器端口映射到 EC2 主机        |
| 推送镜像到 Docker Hub 或 ECR | 解耦构建和部署，EC2 不必包含源码                    |
| 使用非 root 用户（进阶）        | 为了安全，推荐在 Dockerfile 最后添加非 root 用户（可选） |


## 在 AWS EC2 上使用 Docker 部署你的项目
1. 准备 EC2 实例: 通过 Terraform 或 AWS 控制台启动一个 Amazon Linux 2 或 Ubuntu 实例，并开放如下端口
- 22（SSH）
- 8080（Spring Boot）
- 9090（Prometheus，如果启用监控）
2. 在 EC2 上安装 Docker
3. 构建并运行你的容器
```
docker pull zhanyaodocker/my-java-app:latest
docker run -d -p 8080:8080 --name my-java-app zhanyaodocker/my-java-app:latest
```
4. 然后通过浏览器访问`http://<你的EC2公网IP>:8080/`
## 需要掌握的基本命令
```
docker build -t my-java-app .
docker run -d -p 8080:8080 --name my-java-app my-java-app
docker stop my-java-app
docker rm my-java-app
docker logs -f my-java-app
```

## 下一步建议
- 使用 docker-compose.yml 管理多容器（如 Prometheus + MyApp）
- 学习 Docker Volume 管理持久数据
- 使用 GitHub Actions 实现 CI/CD 自动部署
- 配置 systemd 守护容器或使用 Docker restart policy

