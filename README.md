# terraform-ecs-example

A terraform template to establish an ECS Cluster intergrate with **Auto Scaling Group**, **Launch Configuration**, **Application Load Balancer**, **Target Group**, **Cloud Watch - log group** and **Route 53**.

In this example we use [pmorjan/demo](https://hub.docker.com/r/pmorjan/demo/) a very tiny golang based webserver container as our source container image. 
## 1. Artitecture and scenario
Think about a real case, an user vist your website via Route 53 endpoint.

This endpoint is associated with an Application Load Balancer's DNS name.

Internet traffic through Application Load Balancer forward to the container of ECS Cluster. Container operation log will store in Cloud Watch log group.  

Consider High Availability (HA) environment we might setup ECS Cluster with Multi-AZ and Auto Scaling Group.

![artitecture](https://imgur.com/AkJsjAU.png)

