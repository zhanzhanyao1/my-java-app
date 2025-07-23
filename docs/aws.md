### ✅ AWS 学习进度表

| 分类           | 服务名称                  | 是否已学习 | 学习优先级 | 说明                           |
|----------------|---------------------------|-------------|-------------|--------------------------------|
| **计算服务**   | EC2                       | ✅ 是       | ⭐⭐⭐⭐       | 虚拟机，核心计算服务           |
|                | Auto Scaling (ASG)        | ✅ 是       | ⭐⭐⭐⭐       | 自动弹性伸缩                   |
|                | Elastic Beanstalk         | ✅ 是       | ⭐⭐         | 应用托管平台                   |
|                | ECS (Fargate)             | ✅ 是       | ⭐⭐⭐⭐       | 容器编排服务                   |
|                | EKS                       | 🕒 尚未     | ⭐⭐         | Kubernetes 托管服务            |
|                | Lambda                    | 🕒 尚未     | ⭐⭐⭐⭐       | 无服务器计算                   |
|                | App Runner                | ✅ 是       | ⭐⭐         | 部署小型容器应用               |
| **存储服务**   | S3                        | ✅ 是       | ⭐⭐⭐⭐       | 对象存储服务                   |
|                | EBS                       | ✅ 是       | ⭐⭐⭐        | EC2 块存储                     |
|                | EFS                       | ✅ 是       | ⭐⭐         | 网络文件系统                   |
|                | FSx                       | 🚫 跳过     | ❌          | 高性能文件系统（可跳过）       |
|                | AWS Snow Family           | 🚫 跳过     | ❌          | 离线数据迁移设备（可跳过）     |
| **数据库**     | RDS                       | ✅ 是       | ⭐⭐⭐⭐       | 关系型数据库                   |
|                | Aurora                    | ✅ 是       | ⭐⭐⭐⭐       | 高性能 RDS                     |
|                | DynamoDB                  | 🕒 尚未     | ⭐⭐⭐        | 无服务器 NoSQL 数据库         |
|                | ElastiCache               | ✅ 是       | ⭐⭐         | Redis/Memcached 缓存服务      |
| **网络 & CDN** | VPC                       | 🕒 尚未     | ⭐⭐⭐⭐       | 网络基础设施                   |
|                | ELB (ALB/NLB)             | ✅ 是       | ⭐⭐⭐⭐       | 负载均衡器                     |
|                | Route 53                  | ✅ 是       | ⭐⭐⭐        | DNS 服务                       |
|                | CloudFront                | 🚫 跳过     | ❌          | CDN 加速服务（可跳过）         |
|                | Global Accelerator        | 🚫 跳过     | ❌          | 网络加速器（可跳过）           |
| **消息队列**   | SQS                       | ✅ 是       | ⭐⭐⭐⭐       | 解耦队列服务                   |
|                | SNS                       | ✅ 是       | ⭐⭐⭐        | 推送/发布订阅服务              |
|                | Kinesis                   | ✅ 是       | ⭐⭐         | 实时数据流处理                 |
| **容器服务**   | ECR                       | ✅ 是       | ⭐⭐⭐        | 容器镜像仓库                   |
|                | ECS                       | ✅ 是       | ⭐⭐⭐⭐       | 容器编排服务                   |
|                | EKS                       | 🕒 尚未     | ⭐⭐         | 托管 Kubernetes                |
| **监控安全**   | CloudWatch                | 🕒 尚未     | ⭐⭐⭐⭐       | 日志与指标监控                 |
|                | CloudTrail                | 🕒 尚未     | ⭐⭐⭐        | API 审计日志                   |
|                | Config                    | 🕒 尚未     | ⭐⭐         | 合规性追踪                     |
|                | KMS                       | 🕒 尚未     | ⭐⭐⭐        | 密钥管理服务                   |
|                | IAM                       | ✅ 是       | ⭐⭐⭐⭐       | 权限管理核心                   |
|                | SSM Parameter Store       | 🕒 尚未     | ⭐⭐         | 运维配置与参数存储             |






### IAM
- Users & Groups
- root user & IAM user
- Policies
- Password Policy & MFA
- Access Key & CLI & SDK
- IAM Roles(ex. Allows EC2 instances to call AWS services on your behalf.)
- IAM Security Tools:Credential Report & Last Accessed
- Best Practices:
  - Don't use root account
  - one physical user = one Aws user
  - assign users to groups and assign permissions to groups
  - create a strong password policy
  - enforce the use of MFA
  - use Roles for giving permissions to AWS services
  - use Access keys for programmatic access(CLI/SDK)
  - audit permissions of your account using Credential Report & Last Accessed
  -  Never share IAM users and Access Keys

### EC2 Fundamentals
- budget alert
- EC2 basics
  - sizing and configuration: OS/CPU/RAM/Storage/Network/Firewall
  - EC2 User Data
- EC2 instant types:[compare](https://instances.vantage.sh/)
- Security Group
- SSH
- Purchasing Option
- Spot Instance
- Private/Public/Elastic IP
- Placement Strategy
- Elastic Network Interfaces[ec2实例访问网络的工具](https://aws.amazon.com/es/blogs/aws/new-elastic-network-interfaces-in-the-virtual-private-cloud/)
- EC2 Hibernate

### EC2 Instance Storage
- EBS: Elastic Block Store
- EBS Snapshots(the way to transform EBS volume to another AZ)
- AMI: Amazon Machine Image
- EC2 Instance Store(physical storage with EC2)
- EBS type(size,throughput IOPS)
- EBS Multi-Attach(one EBS(io1,io2) to some(16) EC2 instances in same AZ)
- EBS encryption
- EFS: Elastic File System

### High Availability and Scalability
- Vertical Scalability(t2.micro->ta.large), Horizontal Scalability(increase the number of instance), High Availability(survive a data center loss)
- ELB: Elastic Load Balancing
- Load Balancer type
  - Application Load Balancer
  - Network Load Balancer
  - Gateway Load Balancer
- attributes: sticky sessions/cross zone 
- SSL/TLS:encrypte 
- ASG: Auto Scaling Group(自动创建和删除EC2 instances)
- ASG Launch Template(AMI/Instance type/EC2 User Data/EBS Volumes/Security Groups/SSH Key Pair/IAM roles for EC2 instance/VPC+Subnet Information/load balancer information)
- Scaling Policies:

### Amazon RDS & Aurora
- Relationship Database Service
- Postgres/MySQL /MariaDB/Oracle/Microsoft SQL Service/IBM DB2/Aurora
- Storage auto scaling：RDS DB instance **read** replica
- RDS Multi AZ(Disaster Recovery)
- RDS vs. RDS custom
- Amazon Aurora(read instance + write instance)
- RDS automated backup/ Manual DB snapshot/Aurora DB Clone
- RDS & Aurora Security
- Amazon RDS Proxy
- ElastiCache

### Route 53
- Domain Registrar + Domain Service
- Record TTL
- Record Type

### Use Case: WhatIsTheTime
user -> route 53 -> ELB(Multi AZ) -> ASG
1. **使用 Elastic IP 绑定 EC2 实例**
  - 优化原因：希望 EC2 实例有一个静态 IP 地址，实例重启时 IP 不变，方便用户访问。
  - 优化后挑战：单实例，流量增长时性能不足，且单实例故障导致服务不可用。

2. **垂直扩展（更换更大实例类型）**
  - 优化原因：T2 Micro 实例无法满足增加的流量，升级到 M5 大实例来处理更多负载。
  - 优化后挑战：升级过程中有停机时间，用户体验受影响；单实例性能提升有限，仍难以应对持续增长。

3. **水平扩展（增加多个 EC2 实例，每个带 Elastic IP）**
  - 优化原因：通过多实例分摊流量，提高整体处理能力。
  - 优化后挑战：需要管理多个 Elastic IP，用户需知道多个 IP，管理复杂且受限于 Elastic IP 配额。

4. **改用 Route 53 A 记录管理多实例 IP，取消 Elastic IP**
  - 优化原因：Elastic IP 数量受限且难管理，改用 DNS 返回多实例 IP，用户通过域名访问。
  - 优化后挑战：Route 53 TTL 为一小时，实例下线后用户仍访问旧 IP 导致请求失败，影响用户体验。

5. **引入负载均衡器（ELB）和 Route 53 Alias 记录**
  - 优化原因：ELB 实现请求分发和健康检查，避免用户直接访问实例 IP，解决 TTL 缓存问题。
  - 优化后挑战：需要手动添加和移除实例，管理仍复杂。

6. **引入自动伸缩组（ASG）管理 EC2 实例**
  - 优化原因：自动按需扩缩容，减少人工干预，实现成本和资源的动态调整。
  - 优化后挑战：初期只部署在单个可用区，存在单点故障风险。

7. **实现多可用区（Multi-AZ）部署**
  - 优化原因：提高高可用性，避免某个可用区故障导致整体服务不可用。
  - 优化后挑战：无（文中未提及具体挑战）。

8. **预留实例与按需实例混合使用**
  - 优化原因：保证最小容量实例预留，节省长期成本；临时负载用按需或竞价实例。
  - 优化后挑战：竞价实例可能被中断，需考虑实例被终止风险。

### Use Case: MyClothes
route 53 + ELB(Multi AZ) + ASG -> ELB Stickiness-> Web Cookies-> session id in web cookies+ElastiCache->RDS->RDS replicas->RDS multi AZ
1. 优化动因：解决购物车状态丢失问题（无状态应用导致请求被不同实例处理，购物车数据丢失）
- 用户多次请求被不同实例处理，导致购物车内容丢失，用户体验极差，导致流失和损失收入。
- 优化方案：ELB Stickiness（会话粘滞/会话亲和性:让用户请求绑定到同一台实例，保证购物车不会丢失。
- 优化后挑战：如果绑定的 EC2 实例异常终止，购物车仍会丢失。粘滞会话降低了系统弹性和负载均衡效果。

2. 优化动因：提升应用无状态性，避免依赖实例存储购物车，提升横向扩展能力：购物车数据放在用户端，通过 Web Cookies 传递，避免服务端存储购物车状态。
- 优化方案：Web Cookies 存储购物车内容：每次请求都携带购物车信息，实现无状态的服务端设计。
- 优化后挑战：：HTTP 请求体积增大，影响性能。 Cookie 有大小限制（4KB），不适合大数据存储。 安全风险，Cookie 容易被篡改，需服务端验证。

3. 优化动因：解决 Cookie 存储购物车数据带来的安全和性能问题，减少传输数据量，提升安全性，防止篡改。
- 优化方案：使用 Session ID + ElastiCache 存储会话数据 ：只传递 Session ID，购物车数据存放在高速缓存（ElastiCache。多实例共享缓存，实现请求无状态。
- 优化后挑战：需要维护缓存系统，保证缓存数据的高可用和一致性。 应用逻辑复杂度提升，涉及缓存读写和失效管理。

4. 优化动因：需要持久化存储用户数据（如地址等长期数据） ，购物车数据之外，还需存储用户详细信息。
- 优化方案：使用 RDS 存储用户数据 ：各实例直接访问 RDS，实现持久存储和访问。
- 优化后挑战： RDS 单实例写入瓶颈，读请求压力大。 需要横向扩展读能力。

5. 优化动因：读请求量大，RDS 读压力上升，性能瓶颈 :用户大量浏览商品信息导致读请求激增。
- 优化方案：RDS 读副本（Read Replicas） + ElastiCache 缓存读优化 ,使用最多15个只读副本分担读取压力。 通过缓存机制减少对 RDS 的访问，提升响应速度。
- 优化后挑战： 读副本复制延迟导致数据不一致风险。 缓存维护复杂，需要管理缓存失效和一致性。 业务逻辑增加，缓存穿透等问题需防范。

6. 优化动因：需要应对单个可用区故障，提升系统高可用性与灾备能力 :AWS 可用区可能发生故障，需保证系统可用性。
- 优化方案：Multi AZ 架构 :Route 53 高可用 ,ELB 多可用区部署 ,ASG 多可用区部署 ,RDS Multi AZ 自动故障切换 ,ElastiCache Multi AZ 支持
- 优化后挑战： 成本显著增加（多可用区资源复制） 架构复杂度提升，故障恢复测试和运维压力加大。

7优化动因：强化安全性，避免资源被非授权访问 :网络安全风险，限制访问来源。
- 优化方案：安全组细粒度访问控制 :ALB 允许 HTTP/HTTPS 公网访问 ,EC2 仅允许 ALB 访问 ,ElastiCache 仅允许 EC2 访问 ,RDS 仅允许 EC2 访问
- 优化后挑战：安全策略管理复杂，配置错误易导致服务不可用。需要严格管理安全组规则和权限边界。

### Use Case: MyWordPress
Route 53 + ELB(Multi AZ) + ASG + RDS(Multi AZ)
EC2+EBS-> EC2+EFS
1. 优化动因：需要可扩展的关系型数据库支持，保障数据高可用和读写扩展能力,WordPress 需要存储博客内容及用户数据（图片、文章等）,需求全球扩展，需支持多可用区高可用和读写分离
- 优化方案：使用 RDS Multi AZ，升级为 Aurora MySQL（支持 Multi AZ、读副本和全球数据库）,Aurora 具有更好的扩展性和易用性，减少运维工作。
- 优化后挑战： Aurora 方案成本较高。 复杂的数据库架构设计和运维管理。 需评估业务规模与成本的权衡。

2. 优化动因：解决单实例 EBS 存储图片的局限性，支持多实例多可用区访问相同文件 ,单实例 + EBS 可用，但多实例多 AZ 时，EBS 卷仅挂载在单个实例，其他实例无法访问对应数据。 多实例环境下，图片上传和读取出现数据不一致和访问失败问题。
- 优化方案：用 EFS（Elastic File System）替代 EBS，作为共享网络文件存储 :EFS 通过 ENI（弹性网络接口）挂载到各个 AZ 的 EC2 实例，实现统一文件访问。 ,支持多实例、多 AZ 共享同一文件存储，保证图片上传与读取一致。
-优化后挑战：EFS 成本高于 EBS，持续成本上升。 网络存储带来的性能瓶颈需评估，尤其对高并发访问场景。 需管理和维护网络文件系统的权限和性能。

### Elastic Beanstalk
- create application -> upload version -> launch env -> manage env
- Env tier:Web Server Tier(ELB)/Worker Tier(SQS)
- Deployment Modes: single instance(elastic IP + EC2 instance +RDS Master)/ High availability with load balancer(ALB +ACG + RDS master/standby)


### Amazon S3
- key(full path)-Object(files)
- S3 -> Buckets -> \[folder] -> object
- Security: user-based/resource-based 
- Versioning(bucket level)
- Replication Rule(Cross-Region/Same-region)
- S3 Storage classes
- Lifecycle rules
- Amazon S3 Analytics
- Requester pays(download networking cost)
- S3 Event: can be sent to SQS,SNS, Lambda
- Performance
- Bulk Operation: S3 Inventory(get objectList)-> Athena(filter) -> S3 Bulk Operation
- S3 Store Lens: analyse org/accs/regions/buckets
- encryption:skip for now

###  CloudFront
- skip
### Global Accelerator
- skip
###  AWS Snow Family
- skip
###  Amazon FSx
- skip

### Decoupling application:
- SQS
- Producer -> SQS -> Consumer(pull data)
- Visibility Timeout
- Long Polling
- SQS+ASG+cloudwatch Metric-queue + cloudwatch alarm
- SNS(push data)
- Fan-out: publisher -> 1 SNS -> n SQS
- Message filtering for subscriber

### Container on AWS
- ECS
- EC2 Launch type/Fargate Launch type
- ECS task roles
- Load Balancer + ECS Cluster
- EFS + ECS Cluster
- ECS cluster：Task definition->create tasks or services
- ECS Auto scaling
- ECR
- EKS skip for now
- AWS App Runner
- AWS App2Container