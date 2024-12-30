# AWSNetworkingSetup
This is a guide on how to create a basic secure networking setup for your AWS enviroment.

## VPC Setup

First, we will head to the VPC section in the AWS console.
From there we will create a VPC, we will leave everything default and set the IPv4 CIDR as 10.0.0.0/20, this gives us 4096 addresses and can be changed according to your needs.
![VPC](https://i.imgur.com/x2bfrvy.png)

Next, we will head into the VPC settings and enable DNS hostnames, this step is optional, however it may come in useful if you want to use DNS hostnames.
![Enable DNS hostnames](https://i.imgur.com/DtK5uIk.png)

## Subnet Setup

Next, we will head to the subnet section and we will create 4 subnets, 2 in each availability zone, 1 public and 1 private in each.
We will choose the previously created VPC for our subnets.
Each subnet should also have a different IPv4 subnet CIDR block, we will use 10.0.x.0/24 for our subnets, the CIDR notation can be changed according to your needs.
![Public Subnet 1](https://i.imgur.com/toiP9LJ.png)
![Public Subnet 2](https://i.imgur.com/02uXRrf.png)
![Private Subnet 1](https://i.imgur.com/LlTuyLc.png)
![Private Subnet 2](https://i.imgur.com/NVSlMzY.png)


## Internet Gateway

Now, we will setup the internet gateway, we will go to the Internet Gateway section, press create internet gateway and give it a name:
![Internet Gateway](https://i.imgur.com/SMSZQUi.png) 

After it's been created we will click on the actions button and click "Attach to VPC", and we will attach the internet gateway to the VPC we created earlier.
![Attach VPC to IGW](https://i.imgur.com/gip2yvi.png)

## NAT Gateways

Now, we will create two NAT gateways, one for each availability zone.
To do this we will go to the NAT gateway section, press create and we will choose our first public subnet to place it in, and also allocate an elastic IP for it, we will leave the connectivity type as public.
![Create first NAT gateway](https://i.imgur.com/ffDX8qv.png)

Next, we will do the same thing but create it in the second public subnet:
![Create second NAT gateway](https://i.imgur.com/VYCass5.png)

Now we have a fully functioning networking setup in our AWS enviroment!
