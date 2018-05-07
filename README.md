# terraform-ecs-example

A terraform template to establish an ECS Cluster integrate with **VPC**, **IAM-Role**, **Auto Scaling Group**, **Launch Configuration**, **Application Load Balancer**, **Cloud Watch-log group** and **Route 53**.

In this example we use [pmorjan/demo](https://hub.docker.com/r/pmorjan/demo/) a very tiny golang-based webserver container as our source container image. 
## 1. Artitecture and Scenario
Think about a real case, a user visit your website via Route 53 endpoint.

This endpoint is associated with an Application Load Balancer's DNS name.

Internet traffic through Application Load Balancer forward to the container of ECS Cluster. Container operation log will store in Cloud Watch log group.

Consider a High Availability (HA) environment we might setup ECS Cluster with Multi-AZ and Auto Scaling Group.

![artitecture](https://imgur.com/AkJsjAU.png)
## 2. Repository architecture
```
.
├── alb.tf
├── assume_role_policy
│   ├── assume_instance.json
│   └── assume_service.json
├── autoscaling.tf
├── cloudwatch.tf
├── definitions
│   └── example_definition.json
├── dhcp.tf
├── ecs.tf
├── iam.tf
├── internet_gateway.tf
├── network_acl.tf
├── provider.tf
├── route53.tf
├── route_table.tf
├── securitygroup.tf
├── subnet.tf
├── variables.tf
└── vpc.tf

2 directories, 18 files
```
- **alb.tf**: Describe Application Load Balancer settings.
- **assume_instance.json**: Assume policy for ECS Instance Role.
- **assume_service.json**: Assume policy for ECS Service Role.
- **autoscaling.tf**: Describe Auto Scaling and Launch Configuration settings.
- **cloudwatch.tf**: Describe Cloud Watch log group settings.
- **example_definition.json**: Describe ECS Task Definition's detailed information.
- **dhcp.tf**: Describe VPC-DHCP settings. 
- **ecs.tf**: Describe ECS-Cluster, ECS-Service and ECS-Task settings.
- **iam.tf**: Describe IAM Role settings for ECS-Instance and ECS-Service.
- **internet_gateway.tf**: Describe VPC-Internet Gateway settings.
- **network_acl.tf**: Describe VPC-ACL settings.
- **route53.tf**: Describe DNS name for Application Load Balancer endpoint.
- **route_table.tf**: Describe VPC-Route Table settings.
- **securitygroup.tf**: Describe VPC-Security Group settings.
- **subnet.tf**: Describe VPC-Subnet settings.
- **vpc.tf**: Describe VPC settings.

## 3. Variables
Pay attention to `acm_certificate_arn`, `route53_endpoint` and `route53_public_zoneid` in `variables.tf`. Those variables should replace by your own AWS resource.

Here are some introductions for your reference:

1. How to get an ACM certificate: https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request.html
2. How to create a Route 53 Hosted Zone: https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingHostedZone.html

## 4. Usage
1. Install terraform modules.
```
terraform init
```
2. Apply terraform template.
```
terraform apply -var aws_access_key={your_access_key} -var aws_secret_key={your_secret_key}
```

## 5. Result
Open browser and paste the Route53 DNS name(route53_endpoint) you list in variables.tf.

You can see Gopher Server is running now.

<img src="https://i.imgur.com/uHHx17b.png"/>
