## IAM

- AWS IAM (Identity and Access Management) is a service provided by Amazon Web Services (AWS) that helps you manage access to your AWS resources. It's like a security system for your AWS account.
- IAM allows you to create and manage users, groups, and roles.
- Users - Individual entities
- Groups- Collection of users, making it easier to manage permissions
- Roles - Temporary access to external entities or services
- Policies - set of permissions creates a policy and then attched to IAM entities(users, groups and roles)
- For more info https://github.com/iam-veeramalla/aws-devops-zero-to-hero/tree/main/day-2

**Policies**

- Inline policy- this policy can only be attached to user who is not part of any group.
- Policy Structure
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/77fbe9bc-8e37-4d8c-b699-21ba65c71f82)

**Security tools**

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/285bddfe-e2d5-47c9-ada9-de41ace2ba5e)

**Iam Best Practices**

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/105bda8b-dc78-4b10-bba3-a731c92d996f)



### Difference between IAM user and Federated user

In AWS, Federated Users and IAM (Identity and Access Management) Users are two different approaches to managing and authenticating users within an AWS environment.

1. **IAM User:**
   - IAM Users are created and managed directly within the AWS Identity and Access Management (IAM) service.
   - These users have a set of security credentials (Access Key ID and Secret Access Key) associated with them, which are used for programmatic access to AWS services.
   - IAM Users are typically used for non-human entities, such as applications, scripts, or services that require programmatic access to AWS resources.
   - Authentication is done using the IAM user's credentials.

2. **Federated User:**
   - Federated Users, on the other hand, are users whose authentication is managed outside of AWS (e.g., through an external identity provider like Active Directory, Google, or Facebook).
   - Users authenticate through an external identity provider and receive temporary AWS security credentials to access resources.
   - Federation allows organizations to use their existing identity systems and extend them to AWS without creating separate IAM users for each user.
   - Federation supports single sign-on (SSO) and can enhance security by reducing the number of credentials to manage.

In summary, IAM Users are directly managed within AWS and have their credentials, whereas Federated Users leverage an external identity provider for authentication and receive temporary credentials to access AWS resources. The choice between IAM Users and Federated Users depends on the organization's requirements, existing identity systems, and security preferences.

*****************************************************************************************************************************************************************************************

**AWS Role : Assume Role**
In this demo, we will create generic role and then will create a user and that user will assume that role.

**Steps**
- **Step 1**- Create standalone user, which is not part of any group.
- **Step 2** - Create IAM role. While creating role select "AWS Account" as the entity type. Select "This account"
- Both user and role are not related.
- **Step 3** - Create policy and attach it to role.
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/23b8c008-9b55-4a2e-8b56-67382ca386ef)
- **Step 4** - Attach role to the user.
- Navigate to User -> select user -> add permissions -> create inline policy -> specify permissions
  ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/c54b1d4f-3d40-4092-9bad-0474f429378a)
  - Under resource give role arn.
  - Now test the assume role functionality.
  - Go to the role -> copy the link to switch the role -> use this url to switch the role. For this you should be already logged in to the user.
  - To switch back to user again click on switch back from top right corner.
 
_________________________________________________________________________________________________________________________

### AWS Organisation


![image](https://github.com/muppin/mastering-DevOps/assets/121821200/06adfd04-2733-489b-8542-c26558d581dc)
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/83baedeb-ccf8-4817-b66b-b2a338cfc51e)
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/ed96d630-491e-4040-8f69-f74f1a514d4b)
![image](https://github.com/muppin/mastering-DevOps/assets/121821200/50aa651a-c0f3-4e45-b3cb-eead43cb0314)




- basically with the help of aws organisation we create oragnisation unit and then create a account inside the ou
- the new account should have different email address.
- we can have seperate environments with the help of aws organisation for ex Test, sandbox, Dev, pre-prod, prod.


- 
