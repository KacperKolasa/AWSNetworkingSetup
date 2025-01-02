# AWS Manual Networking Setup

This guide provides a detailed walkthrough for setting up a secure, basic networking environment in AWS, suitable for small-to-medium applications. We'll explain each component used and its purpose to help you understand the architecture.

## Overview

The setup includes the following components:

1. **VPC (Virtual Private Cloud)**: The foundational networking layer.
2. **Subnets**: Divided into public and private subnets for organization and security.
3. **Internet Gateway (IGW)**: Allows public subnets to communicate with the internet.
4. **NAT Gateway**: Enables instances in private subnets to access the internet securely.
5. **Route Tables**: Define how traffic is routed within the VPC and to external destinations.

This setup creates high availability by utilizing two availability zones.

---

## VPC Setup

The Virtual Private Cloud (VPC) serves as the foundation for your AWS networking environment.

1. Navigate to the **VPC** section in the AWS Console.
2. Create a new VPC, leaving most settings as default, and set the **IPv4 CIDR block** to `10.0.0.0/20`. This gives you 4096 IP addresses, which can be adjusted based on your needs.

   - **Why use a VPC?**
     - A VPC isolates your resources for better security and control.
     - It allows custom CIDR blocks to define your IP address range.

   ![VPC](https://i.imgur.com/x2bfrvy.png)

3. After creating the VPC, enable DNS hostnames in the **VPC settings**. While optional, this is useful for identifying resources via DNS names.

   ![Enable DNS hostnames](https://i.imgur.com/DtK5uIk.png)

---

## Subnet Setup

Subnets partition the VPC into smaller segments for better organization and security.

1. Go to the **Subnet** section and create four subnets:
   - **Two public subnets** (one in each availability zone).
   - **Two private subnets** (one in each availability zone).

2. Use the following CIDR blocks (adjust as needed):
   - Public Subnet 1: `10.0.0.0/24`
   - Public Subnet 2: `10.0.1.0/24`
   - Private Subnet 1: `10.0.2.0/24`
   - Private Subnet 2: `10.0.3.0/24`

   - **Why use public and private subnets?**
     - Public subnets allow direct internet access for resources like load balancers.
     - Private subnets are for internal resources, ensuring security.

   ![Public Subnet 1](https://i.imgur.com/toiP9LJ.png)
   ![Public Subnet 2](https://i.imgur.com/02uXRrf.png)
   ![Private Subnet 1](https://i.imgur.com/LlTuyLc.png)
   ![Private Subnet 2](https://i.imgur.com/NVSlMzY.png)

---

## Internet Gateway (IGW)

An **Internet Gateway** connects public subnets to the internet.

1. Create an Internet Gateway and name it appropriately:

   ![Internet Gateway](https://i.imgur.com/SMSZQUi.png)

2. Attach the Internet Gateway to your VPC:

   ![Attach VPC to IGW](https://i.imgur.com/gip2yvi.png)

   - **Why use an Internet Gateway?**
     - It provides public internet access for resources in public subnets.

---

## NAT Gateways

**NAT Gateways** enable instances in private subnets to access the internet while remaining unreachable from the outside.

1. Create two NAT Gateways, one in each availability zone:

   - Place the first NAT Gateway in the first public subnet and allocate an Elastic IP:

     ![Create first NAT gateway](https://i.imgur.com/ffDX8qv.png)

   - Repeat the process for the second public subnet:

     ![Create second NAT gateway](https://i.imgur.com/VYCass5.png)

2. Update the **route tables** for private subnets to route internet-bound traffic (0.0.0.0/0) through the respective NAT Gateway.

   - **Why use NAT Gateways?**
     - They allow private resources (e.g., databases) to download updates or communicate externally without exposing them to public access.

---

## Route Tables

**Route Tables** control how traffic is directed within your VPC and to external destinations. Each subnet in your VPC must be associated with a route table to ensure proper routing of traffic.

### Public Route Table Setup

1. **Create a Public Route Table**:
   - Navigate to the route tables section and create a new route table. Name it appropriately for easy identification.

     ![Create Public Route Table](https://i.imgur.com/Es3CEmb.png)

2. **Associate Public Subnets**:
   - Edit the subnet associations by selecting the two public subnets created earlier.

     ![Subnet associations for public route table](https://i.imgur.com/g0Tf1cu.png)

3. **Add a Route to the Internet Gateway**:
   - Add a route for `0.0.0.0/0` (any address) pointing to the Internet Gateway. This allows resources in the public subnets to access the internet.

     ![Create Route For internet gateway](https://i.imgur.com/zc3RAbG.png)

### Private Route Table Setup

1. **Create Private Route Tables**:
   - Create two private route tables, one for each availability zone.

     ![Two private route tables](https://i.imgur.com/Dr4Xi9e.png)

2. **Associate Private Subnets**:
   - Assign each private subnet to its respective private route table.

     ![First private route table](https://i.imgur.com/kQ3XTC8.png)
     ![Second private route table](https://i.imgur.com/lpxi8Cd.png)

3. **Add Routes to NAT Gateways**:
   - For each private route table, add a route for `0.0.0.0/0` pointing to the corresponding NAT Gateway in the same availability zone.

     ![Route for NAT gateway 1](https://i.imgur.com/nUUt757.png)
     ![Route for NAT gateway 2](https://i.imgur.com/8fbU6qe.png)

### Why Use Separate Route Tables?

- **Public Route Table**:
  - Ensures that internet-facing resources in public subnets can communicate with the internet via the Internet Gateway.
- **Private Route Tables**:
  - Enable secure internet access for resources in private subnets through NAT Gateways.
  - Maintain isolation from public traffic while allowing controlled outbound communication.

This separation provides fine-grained control over traffic flow, ensuring security and high availability across the VPC.

---

## Final Architecture

With this setup, you now have:

1. A **VPC** spanning two availability zones.
2. **Public subnets** for internet-facing resources.
3. **Private subnets** for secure, internal-only resources.
4. **Internet Gateway** for public internet access.
5. **NAT Gateways** for secure outbound traffic from private subnets.
6. **Route tables** directing traffic appropriately based on subnet type.

This creates a scalable and secure networking foundation for your AWS environment!
