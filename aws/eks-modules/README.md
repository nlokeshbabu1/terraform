# EKS Cluster with VPC and Networking Components

This Terraform project sets up an Amazon EKS (Elastic Kubernetes Service) cluster along with the necessary VPC (Virtual Private Cloud) and networking components, including subnets, NAT Gateway, and security groups.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS CLI configured with appropriate credentials. (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- An AWS account with permissions to create the necessary resources.
- kubectl  (https://kubernetes.io/docs/tasks/tools/)
- eksctl  (https://eksctl.io/installation/)

## Project Structure

- `vpc.tf`: Contains the configuration for the VPC, subnets, NAT Gateway, and related networking components.
- `eks.tf`: Contains the configuration for the EKS cluster and node group.
- 'iam-role' : container the iam role requried for cluster and node group.
- 'eks-add-on' : contains the eks add on like kube-proxy , vpc_cni , codeDNS
- `variables.tf`: Defines the input variables used in the Terraform configuration.
- `outputs.tf`: Defines the output values of the Terraform configuration.

## Usage

1. **Clone the repository**:
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Initialize Terraform**:
    ```sh
    terraform init
    ```

3. **Review and modify variables**:
    - Open `variables.tf` and review the default values. Modify them as needed for your environment.

4. **Plan the infrastructure**:
    ```sh
    terraform plan
    ```

5. **Apply the configuration**:
    ```sh
    terraform apply
    ```

6. **Destroy the infrastructure** (when no longer needed):
    ```sh
    terraform destroy
    ```

## Configuration Details

### VPC and Networking

- **VPC**: A Virtual Private Cloud to host the EKS cluster.
- **Subnets**: Two private subnets in different Availability Zones.
- **NAT Gateway**: A NAT Gateway to allow instances in private subnets to access the internet.
- **Elastic IP**: An Elastic IP address for the NAT Gateway.
- **Internet Gateway**: An Internet Gateway for public subnets.
- **Route Tables**: Route tables for public and private subnets.

### EKS Cluster

- **EKS Cluster**: An Amazon EKS cluster.
- **Node Group**: A managed node group for the EKS cluster.
- **Security Group**: A security group for the EKS cluster.

## Variables

The following variables are defined in `variables.tf`:

- `vpc_cidr`: The CIDR block for the VPC.
- `availability_zone`: A list of availability zones.
- `nat_gateway_name`: The name tag for the NAT Gateway.
- `internet_gateway_name`: The name tag for the Internet Gateway.
- `eks_node_instance_type`: The instance type for the EKS nodes.
- `eks_cluster_name`: The name of the EKS cluster.

## Outputs

The following outputs are defined in `outputs.tf`:

- `vpc_id`: The ID of the VPC.
- `eks_cluster_id`: The ID of the EKS cluster.
- `eks_node_group_id`: The ID of the EKS node group.


## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact

For any questions or support, please open an issue in the repository.
