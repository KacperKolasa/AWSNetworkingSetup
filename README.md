# AWSNetworkingSetup
This is a guide on how to create a basic secure networking setup for your AWS enviroment.

## VPC Setup

First, we will head to the VPC section in the AWS console.
From there we will create a VPC, we will leave everything default and set the IPv4 CIDR as 10.0.0.0/24, this gives us 256 addresses and can be changed according to your needs.
![]()

Next, we will head into the VPC settings and enable DNS hostnames, this step is optional, however it may come in useful if you want to use DNS hostnames.
![]()

Next, we will head to the subnet section and we will create 4 subnets, 2 in each availability zone, 1 public and 1 private in each.
We will choose the previously created VPC for our subnets.
Each subnet should also have a different IPv4 subnet CIDR block, we will use 10.0.x.0/26 for our subnets, the CIDR notation can be changed according to your needs.
![]()
![]()
![]()
![]()
