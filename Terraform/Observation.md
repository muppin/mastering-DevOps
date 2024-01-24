**What happens after terraform init command?**

$ terraform init

Initializing the backend...
Initializing modules...
- eks in eks
- sgs in sg_eks

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.32.1...
- Installed hashicorp/aws v5.32.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary```

____________________________________________________________________________________________________________________________

- Demo - https://www.youtube.com/watch?v=acnpInts120
- repo- https://github.com/ravdy/youtube_terraform
- After creating cluster, modify kubeconfig file-
- aws eks update-kubeconfig --region ap-south-1 --name ed-eks-01

____________________________________________________________________________________________________________________________

**When does the lock being released?**

In Terraform, a lock is used to prevent concurrent operations that might conflict with each other, such as multiple `terraform apply` commands running simultaneously. The lock ensures that only one Terraform operation can modify the state at a time to prevent race conditions and conflicts.

The lock is typically released in the following scenarios:

1. **Successful Completion:**
   - The lock is released when a Terraform operation completes successfully. This includes `terraform apply` and `terraform destroy` commands. After the changes are applied or resources are destroyed, Terraform releases the lock.

2. **Operation Failure:**
   - If an operation fails for any reason, the lock is generally released. This allows subsequent Terraform operations to proceed. However, it's essential to review the error messages and address any issues that caused the failure before running further operations.

3. **Manual Interruption:**
   - If a user manually interrupts a Terraform operation (e.g., by pressing Ctrl+C during `terraform apply`), the lock is released. However, it's crucial to review the state and ensure that resources are in the expected state.

4. **Lock Timeouts:**
   - Terraform has a configurable lock timeout setting. If a lock is held for longer than the specified timeout, Terraform considers it stale and releases the lock. This prevents indefinite locking in case of network issues, process termination, or other unforeseen circumstances.

It's important to note that Terraform uses a remote backend to store its state. The behavior of lock release might also depend on the specific backend you are using (e.g., Amazon S3, Azure Storage, etc.). Different backends may have slightly different behaviors regarding lock management.

Always exercise caution and review the state carefully, especially in scenarios where locks are released due to failures or manual interruptions, to ensure that the infrastructure is in the desired state. Additionally, consider using remote backends that support atomic operations to enhance the safety and consistency of state management in a collaborative environment.
