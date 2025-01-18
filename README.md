# Terraform AWS Infrastructure Setup and AZURE AKS 

This repository contains Terraform configurations for setting up various AWS infrastructure components, including an EKS cluster, EC2 instances, the necessary VPC and networking components and AZURE AKS .

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS CLI configured with appropriate credentials.
- An AWS account with permissions to create the necessary resources.
- An AZURE account to connect the akz cluster
- kubectl  (https://kubernetes.io/docs/tasks/tools/)
- eksctl  (https://eksctl.io/installation/)

## Project Structure

 - We have Terraform custome modules for EC2 and EKS .
 - We have EC2 with public and private subnets which are fixed values 

## Usage

1. **Clone the repository**:
    ```sh
    git clone https://github.com/nlokeshbabu1/terraform.git
    cd terraform
    ```


2. **Go to the main.tf in ec2 or eks 
     Edit the details as per you requirment 

3. **Initialize Terraform**:
    ```sh
    terraform init
    ```


4. **Review and modify variables**:
    - Open `variables.tf` and review the default values. Modify them as needed for your environment.

5. **Plan the infrastructure**:
    ```sh
    terraform plan
    ```

6. **Apply the configuration**:
    ```sh
    terraform apply
    ```

7. **Destroy the infrastructure** (when no longer needed):
    ```sh
    terraform destroy
    ```

## Configuration Details

### VPC and Networking

- **VPC**: A Virtual Private Cloud to host the EKS cluster and EC2 instances.
- **Subnets**: Public and private subnets in different Availability Zones.
- **NAT Gateway**: A NAT Gateway to allow instances in private subnets to access the internet.
- **Elastic IP**: An Elastic IP address for the NAT Gateway.
- **Internet Gateway**: An Internet Gateway for public subnets.
- **Route Tables**: Route tables for public and private subnets.

### EKS Cluster

- **EKS Cluster**: An Amazon EKS cluster.
- **Node Group**: A managed node group for the EKS cluster.
- **Security Group**: A security group for the EKS cluster.
- **Add-ons**: EKS add-ons such as kube-proxy and CoreDNS.

## Variables 

The following variables are defined in `variables.tf`:

- `vpc_cidr`: The CIDR block for the VPC.
- `availability_zone`: A list of availability zones.
- `nat_gateway_name`: The name tag for the NAT Gateway.
- `internet_gateway_name`: The name tag for the Internet Gateway.
- `eks_node_instance_type`: The instance type for the EKS nodes.
- `eks_cluster_name`: The name of the EKS cluster.
- `ami_id`: The AMI ID for the EC2 instances.
- `instance_type`: The instance type for the EC2 instances.
- `key_name`: The key pair name for the EC2 instances.


### EC2 Instances

- **Public EC2 Instance**: An EC2 instance in a public subnet.
- **Private EC2 Instance**: An EC2 instance in a private subnet.
- **Security Groups**: Security groups for the EC2 instances.

 - 'region' : region you went to configure 
 - 'vpc_cidr' : define the CIDR block 
 - 'ami_id' : The AMI ID for the EC2 Instance to create 
 - 'instance_type': The instance type fot the EC2 instance
- 'sg_name': Security group name
- 'instance_name': EC2 instance name


## Outputs

The following outputs are defined in `outputs.tf`:

- `vpc_id`: The ID of the VPC.
- `eks_cluster_id`: The ID of the EKS cluster.
- `eks_node_group_id`: The ID of the EKS node group.
- `public_instance_id`: The ID of the public EC2 instance.
- `private_instance_id`: The ID of the private EC2 instance.


## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact

For any questions or support, please open an issue in the repository.