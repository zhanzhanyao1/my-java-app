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