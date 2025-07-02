resource "aws_instance" "example" {
  ami           = "ami-0d03cb826412c6b0f" # 可通过AWS EC2控制台或CLI获得
  instance_type = "t2.micro"
   key_name      = "second-aws-key-pair"           # 将这个替换为你实际的 Key Pair 名称


  tags = {
    Name = "MyJavaAppInstance"
  }
}