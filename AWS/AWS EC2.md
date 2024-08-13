### IP Addresses

**Public IP Address:**
- Used for internet-facing resources, dynamically assigned by default.
- Public IP addresses may change when you stop and restart an instance unless it is associated with an Elastic IP address.

**Private IP Address:**
- Used for communication within a VPC, not accessible from the internet.
- Private IP addresses are generally stable as long as the associated resource exists.

**Elastic IP Address:**
- A static, persistent IP address designed for dynamic cloud computing, associated with a specific AWS account.
- An Elastic IP address remains associated with an AWS account until it is explicitly released. It does not change even if the associated instance is stopped and restarted.
- There may be charges associated with an Elastic IP address if it is not associated with a running instance, so it's advisable to release EIPs when not in use to avoid charges.

**CIDR** - Classless Inter-Domain Routing - Method for allocating IP addresses.

### Placement groups

- placement groups are used to influence the way instances are placed within the underlying infrastructure. 
- They are relevant when considering factors such as latency and network traffic between instances

**There are 3 types**

**Cluster**
- Cluster placement groups are used for applications that need low-latency and high-throughput communication between instances. Instances in a cluster placement group are placed in close proximity to each other within a single Availability Zone.
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/6d73ea81-0421-4e56-acbd-be6d76870147)

 **Spread**
- All the ec2 instances are going to be located on different hardware, that is on different availabilty zones. to avoid the risk of simultaneos failure and have high availabilty
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/ec72e40c-cf95-4ba2-a5ad-e4c9e084c86c)
 
**Partition**
- we can have instances spread across partitions in multiple availabilty zones
- you can have upto 7 partitions in az
- each partition represents a rack in aws
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/dff4e9f8-65db-4187-bc82-50c4b8cd9ffc)

### Elastic Network Interfaces (ENI)

- ENIs are fundamental building blocks for constructing scalable and highly available applications within the AWS cloud.
- when you create a instance, the instance comes up with primary network interface i.e. Eth0
- you can attach many more interfaces to the instance, based on the instance type.
- the secondary interface comes the private ip and you can attach a public ip by assoaciating with elastic ip
- each eni can have seperate security groups.
- Attaching a secondary Elastic Network Interface (ENI) to an EC2 instance can increase network bandwidth, enable connections to multiple VPCs, and more.

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/9543f726-c8e9-4d6c-8066-cc11ad5720cf)

For more info https://youtu.be/X6YPNciA8z8?si=8Mm8mtLKSNxLBMym

### EC2 Hibernate

Certainly! **EC2 hibernation** is a feature in Amazon Web Services (AWS) that allows you to pause and resume EC2 instances. Here's how it works:

1. **Hibernation Process**:
   - When you hibernate an instance, Amazon EC2 signals the operating system to perform hibernation (suspend-to-disk).
   - The hibernation process freezes all processes, saves the contents of the RAM to the EBS root volume, and then performs a regular shutdown⁴.
   - The instance's current state, including its RAM contents, is saved to the Amazon Elastic Block Store (EBS) root volume.
   - Attached EBS data volumes are also persisted.
   - When you start a hibernated instance:
     - The EBS root volume is restored to its previous state.
     - The RAM contents are reloaded.
     - Previously attached data volumes are reattached.
     - The instance retains its instance ID.

2. **Prerequisites for Hibernation**:
   - You can't enable hibernation on an existing EC2 instance (whether it's running or stopped).
   - To enable hibernation, you must relaunch the required EC2 instance and configure hibernation at launch².
   - To enable a hibernation to the new launching instance
       - you should select the root ebs volume as encrypted
       - and enable the hibernate option, under advance settings.

3. **Billing and Storage**:
   - You're not charged for instance usage when an instance is hibernated and in the stopped state.
   - However, storage costs apply for EBS volumes, including storage for the RAM contents.
   - If you no longer need an instance, you can terminate it even when it's in a hibernated state¹.

Remember that hibernation is useful for pre-warming instances that take time to bootstrap and build a memory footprint. It allows you to resume an instance from the exact state it was in, preserving in-memory data³. Let me know if you need further assistance! 😊

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/97c342e5-ec48-4c98-b83c-cd06c1527129)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/a8342755-4c68-4bb9-8f4a-ecdcbdab0c05)

### EC2 Storage (EBS and EFS)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/ae8b3a74-f789-4d3f-a934-fa911cf33187)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/027df425-8efb-4705-bbb1-35e8d5be18c7)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/78583988-ac61-4f64-8e78-5410d51c32fc)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/065ee6b9-87c7-4fcf-a676-aab6826b32bc)

#### EC2 instance store


Amazon EC2 instance store, also known as ephemeral storage, refers to the temporary block-level storage that comes with certain types of EC2 instances. Unlike Amazon EBS (Elastic Block Store), which provides persistent and durable storage, instance store is volatile storage that is directly attached to the physical hardware of the EC2 instance.

Here are key characteristics and considerations regarding EC2 instance store:

**Volatile Nature:**

Instance store volumes are temporary and will be lost if the associated EC2 instance is stopped or terminated. They are suitable for temporary data and should not be used for critical, persistent storage.

**Performance:**

Instance store volumes are typically faster in terms of I/O performance compared to Amazon EBS volumes. This is because they are physically attached to the host server.

**Instance Types with Instance Store:**

Certain EC2 instance types come with instance store volumes. These are often labeled as "instance store" or "ephemeral storage" in the instance type description.

#### Amazon EFS 

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/f9acfca6-4251-47d7-85d2-e105e073e704)

#### EBS vs EFS

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/6c2bccbb-68dc-4a52-a7ee-77588f8a133c)

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/75eb6372-d9bd-441c-a73f-eecce6034402)




### AMI

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/d90a7e60-4eb9-46aa-96d5-1e0c9e292c1c)


--------------------------------------------------------------------------------------------------------------------------------------------------------

**What are 2/2 health checks passed in EC2?**


In Amazon EC2, there are two types of health checks that are performed on instances: system status checks and instance status checks.

1. **System Status Check**:
   - The system status check monitors the health of the underlying infrastructure that supports your EC2 instance. It checks for issues at the hypervisor level, such as power or network connectivity problems.
   - System status checks are performed by AWS and are independent of the operating system running on the instance.
   - Examples of issues detected by system status checks include loss of network connectivity, failure of underlying hardware, or issues with the hypervisor.

2. **Instance Status Check**:
   - The instance status check monitors the health of the EC2 instance itself, including the operating system and any applications running on it.
   - Instance status checks verify that the instance's operating system is responding correctly and that any applications running on the instance are functioning properly.
   - Examples of issues detected by instance status checks include failed system checks (e.g., kernel panics), failed system status checks, or misconfigured networking.
   
These health checks are performed periodically by AWS and are essential for ensuring the availability and reliability of your EC2 instances. When an issue is detected during a health check, the instance may be marked as unhealthy, and actions can be taken based on the configured monitoring and recovery settings, such as terminating the instance or initiating auto-recovery processes.

By monitoring both system status and instance status, AWS helps ensure that your EC2 instances are operating properly and that any issues are detected and addressed promptly, minimizing downtime and maintaining the overall health of your infrastructure.

*********************************************************************************************************************************************************

**General Purpose SSD (gp3)**
- 16TB

**General Purpose SSD (gp2)**
- 16TB

**Provisioned IOPS SSD (io1)**
- 16TB

**Provisioned IOPS SSD (io2)**
- 65 TB

**COLD HDD**
- 16TB

**Throughput optimized HDD (st1)**
  - 16TB

**Magnetic Standard**
- 1TB
*****************************************************************************************************************************************************
## there is a node js application and you have to deploy it to EC2, how will you automate it?

To automate the deployment of a Node.js application to an EC2 instance using Jenkins, you can set up a Jenkins pipeline. Below is a detailed guide on how to configure this, including a Jenkins pipeline script example.

### Prerequisites
1. **Jenkins Server**: Set up and running Jenkins server.
2. **EC2 Instance**: An EC2 instance with Node.js, npm, Git, and PM2 installed.
3. **SSH Access**: SSH key pair for accessing the EC2 instance.
4. **Node.js Application**: Stored in a Git repository (e.g., GitHub).
5. **Jenkins Plugins**: Install the following plugins in Jenkins:
   - Git Plugin
   - Pipeline Plugin
   - SSH Agent Plugin

### Steps to Configure Jenkins Pipeline

#### Step 1: Install Jenkins Plugins
Ensure the following plugins are installed on your Jenkins server:
- Git Plugin
- Pipeline Plugin
- SSH Agent Plugin

#### Step 2: Create Jenkins Credentials
1. **Add SSH Key:**
   - Go to Jenkins Dashboard -> Manage Jenkins -> Manage Credentials.
   - Add a new SSH username with private key credentials.
   - Enter a unique ID (e.g., `ec2-ssh-key`), username (`ec2-user`), and paste the private key.

#### Step 3: Create a Jenkins Pipeline Job
1. **Create a New Pipeline Job:**
   - Go to Jenkins Dashboard.
   - Click on "New Item" and select "Pipeline".
   - Enter a name for the job and click "OK".

2. **Configure Pipeline Script:**
   - In the Pipeline section, choose "Pipeline script".
   - Enter the following script:

```groovy
pipeline {
    agent any

    environment {
        EC2_HOST = 'your-ec2-instance-public-dns'
        SSH_CREDENTIALS_ID = 'ec2-ssh-key'  // The ID of the SSH key added in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo/nodejs-app.git' // Replace with your repository URL
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        
        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }
        
        stage('Deploy to EC2') {
            steps {
                sshagent(credentials: [SSH_CREDENTIALS_ID]) {
                    // Copy files to EC2 instance
                    sh """
                    scp -o StrictHostKeyChecking=no -r * ec2-user@${EC2_HOST}:/home/ec2-user/app
                    """
                    // SSH into EC2 instance and restart the application
                    sh """
                    ssh -o StrictHostKeyChecking=no ec2-user@${EC2_HOST} << EOF
                    cd /home/ec2-user/app
                    npm install
                    pm2 stop all
                    pm2 start app.js
                    pm2 save
                    EOF
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful'
        }
        failure {
            echo 'Deployment failed'
        }
    }
}
```

### Explanation of the Jenkins Pipeline Script

1. **Pipeline Block**: Defines the Jenkins pipeline.
    - `agent any`: Runs the pipeline on any available agent.
    - `environment`: Sets environment variables.

2. **Stages**: Defines the various stages in the pipeline.
    - `Checkout`: Clones the Git repository.
    - `Install Dependencies`: Installs Node.js dependencies using `npm install`.
    - `Run Tests`: Runs the test suite using `npm test`.
    - `Deploy to EC2`: Deploys the application to the EC2 instance.
        - `sshagent`: Uses the SSH credentials to connect to the EC2 instance.
        - Copies the application files to the EC2 instance using `scp`.
        - Connects to the EC2 instance via SSH and executes commands to install dependencies and restart the application using `pm2`.

3. **Post Block**: Defines actions to take based on the pipeline result.
    - `success`: Echoes a success message if the deployment is successful.
    - `failure`: Echoes a failure message if the deployment fails.

### Step 4: Run the Jenkins Pipeline
- Save the pipeline job configuration.
- Click "Build Now" to run the pipeline.

### Summary
- **EC2 Setup**: Ensure the EC2 instance is ready with necessary software installed.
- **Jenkins Configuration**: Set up Jenkins with required plugins and SSH credentials.
- **Pipeline Script**: Create a Jenkins pipeline job with a script to automate the deployment.
- **Run Pipeline**: Execute the pipeline to deploy the Node.js application to the EC2 instance.

This setup ensures that your Node.js application is automatically deployed to your EC2 instance every time there is a new commit to the repository, leveraging Jenkins for continuous integration and deployment.


**what is the need of lifecycle manager in EBS?**
**How will you automate the creation and retention of AMI and snapshots?**
**What are different types of instances?**
**How will you do cost optimization in EC2 instances?**
**If you lost ppk/pem file, how will you connect to EC2 instance?**





