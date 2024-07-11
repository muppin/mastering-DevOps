**Serverless** = FAAS (Function As A Service)
**Serverless does not mean there are no servers…it means you just don’t manage / provision / see them**

**AWS Lambda**
- Belongs to the compute family and solves the problem of serverless.
- Virtual functions – no servers to manage!
- Limited by time - short executions
- Run on-demand
- Scaling is automated!
- **Event Driven Approach**
- default execution time in lambda is 3 seconds.
  
- **Benefits**- Cost optimization, secutity/compliance, reduces overhead of handling infrastructure
- **Pricing**- Pay per request and compute time
- **lambda_handler()** - Is the mandatory function. Its like a main function that the serverless architecture calls.

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b6877d2d-a8dd-4d2d-b4a3-32392d8896db)

- **Layers**-AWS Lambda Layers are a way to centrally manage code and data that is shared across multiple functions. You can create a layer that includes libraries, custom runtimes, or other function dependencies. This helps in keeping your function code small and focused, and it allows for easy updates to shared code.
- **Deafault invocation time in lambda is 3 seconds.**

### AWS Lambda

- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/2b974ddd-0bc6-4bd0-abdc-65a1080c9a72)
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/67c2c87f-a005-4148-bfed-df7074b7f8ba)
- ![image](https://github.com/muppin/mastering-DevOps/assets/121821200/b7257347-3901-4c66-a7cb-0df80ab59d1b)




Lambda Vs. EC2

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/a3ff2040-5830-4c46-bb75-6d3974bceddd)


## Real time Project - 

### Project 1 - Cost Optimization

- I wrote a lambda funtion using python
- that will check if any ec2 instance is there with static IP for long time say 6 months but no one is using it
- then this script should notify this and delete that EC2 instance
- everyday at 10 am cloudwatch will trigger this lambda function 
- so instead of creating EC2 instance daily, we can trigger a lambda function
- which will spin up a temporary instance and once the execution of script is done, it will terminate it.
- By this we are optimizing the cost.

### Project 2 - Security and Compliance

- There are some security vulnerabilities with GP2 type volume, so org has decided not to create any GP2 type volume
- Suppose someone has create a GP2 type volume
- I wrote a lambda function which will run everyday at 10 am to check if there is any GP2 type volume
- If yes it will notify the management with SNS notification
- and it will delete it


### Similarly you can say S3 bucket with public access example.

