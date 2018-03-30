# terraform-ecs-example

A terraform template to establish an ECS Cluster intergrate with Auto Scaling Group, Launch Configuration, Application Load Balancer, Target Group, Cloud Watch - log group and Route 53.

In this example we use [pmorjan/demo](https://hub.docker.com/r/pmorjan/demo/) a very tiny golang based webserver container as our source container image. 
# 1. Artitecture diagram
![artitecture](https://imgur.com/AkJsjAU.png)
