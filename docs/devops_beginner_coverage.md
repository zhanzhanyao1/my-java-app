# DevOps Begineer核心能力覆盖情况
## 1. CI
| 能力项 | 初学者目标 | 当前掌握情况 |
|--------|-------------|----------------|
| 自动化构建 | 使用 GitHub Actions 执行构建任务（如 `mvn clean package`） | ✅ 已掌握并配置 CI 工作流 |
| 单元测试集成 | 在 CI 中运行 `mvn test` 并阻止错误提交 | ✅ 已实现测试失败阻止合并 |
| 代码格式检查 | 使用 Spotless 插件进行代码格式校验 | ✅ 已集成 spotless:check 到 CI |
| 构建产物管理 | 构建的 JAR 文件使用 artifact 上传保存 | ✅ 使用 `upload-artifact` 管理构建产物 |
| 自动化测试覆盖率 | 集成 JaCoCo 生成覆盖率报告，并在 CI 阶段检查覆盖率 | ⏳ 尚未集成 JaCoCo，计划纳入 CI 检查 |
| 安全扫描 | 依赖漏洞检查及静态代码分析预备 | ⏳ 计划集成依赖漏洞扫描和 CodeQL SAST，当前未覆盖 |

## 2. CD
| 能力项 | 初学者目标 | 当前掌握情况 |
|--------|-------------|----------------|
| SSH 自动部署 | 通过 GitHub Actions 使用 SSH 登录 EC2 | ✅ 使用 `appleboy/ssh-action` 实现部署 |
| 容器部署 | Docker 镜像部署到远程 EC2 并运行 | ✅ 已实现 Docker pull 和容器运行 |
| 镜像版本控制 | Docker 镜像使用 tag（如 commit ID 或时间戳）管理 | ✅ 支持使用 `TAG=${{ github.sha }}` 或 `date` 生成标签 |
| CD 触发条件 | 主干合并（main 分支 push）触发自动部署 | ✅ 分离CI/CD，部署仅限合并主干后 |
| 凭证管理 | 使用 GitHub Secrets 管理 SSH 密钥和 Docker Hub 密码 | ✅ 已配置 Secrets 并成功部署 |

## 3. Docker
| 能力项 | 初学者目标 | 当前掌握情况 |
|--------|-------------|----------------|
| 编写 Dockerfile | 使用多阶段构建优化体积与安全性 | ✅ 已采用多阶段构建优化镜像 |
| Docker 本地调试 | 能构建、运行、调试本地容器 | ✅ 能在 EC2 上运行和调试容器 |
| 推送镜像 | 镜像推送至 Docker Hub | ⏳ 需确认是否已配置推送及权限管理 |
| 日志管理 | 使用 Spring Boot 默认日志，预留集成 ELK 计划 | ⏳ 尚未集成集中日志系统 |

## 4. IaC
| 能力项 | 初学者目标 | 当前掌握情况 |
|--------|-------------|----------------|
| 使用 Terraform | 编写 `provider.tf` 和 `main.tf` 创建 EC2 | ✅ 已成功部署 EC2 环境 |
| 定义变量 | 使用 `variables.tf` 管理可配置项 | ✅ 已定义变量，提升灵活性 |
| 自动初始化 | 使用 `terraform init && terraform apply` | ✅ 熟练使用 CLI 完成部署 |
| 访问权限配置 | 掌握安全组、访问规则配置以开放端口 | ✅ 解决安全组访问问题，成功访问服务 |
| 安全最佳实践 | 配置安全组、限制访问来源，保护基础设施 | ⏳ 尚在持续优化中 |

## 5. 可观测性与监控
| 能力项 | 初学者目标 | 当前掌握情况 |
|--------|-------------|----------------|
| Prometheus 安装 | 使用 Docker 启动 Prometheus | ✅ 容器部署成功并运行 |
| 应用指标暴露 | Spring Boot 集成 Micrometer 暴露 Prometheus 指标 | ✅ 已通过 Actuator 暴露指标接口 |
| Prometheus 配置 | 编写 `prometheus.yml` 实现监控采集 | ✅ 配置文件正确，能抓取 Java 应用和 Prometheus 自身指标 |
| 常见指标分析 | 能查询如 JVM 内存、请求次数等关键指标 | ⏳ 需加强 PromQL 查询能力 |
| 日志与指标结合分析 | 计划结合日志系统实现全面监控 | ⏳ 尚未集成日志系统 |


# 下一步学习计划
[next](devops_beginner_next.md)