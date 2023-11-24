**Serverless** = FAAS (Function As A Service)
**Serverless does not mean there are no servers…it means you just don’t manage / provision / see them**

**AWS Lambda**
- Virtual functions – no servers to manage!
- Limited by time - short executions
- Run on-demand
- Scaling is automated!
- Event Driven Approach
  
- **Benefits**- Cost optimization, secutity/compliance, reduces overhead of handling infrastructure
- **Pricing**- Pay per request and compute time
- **lambda_handler()** - Is the mandatory function. Its like a main function that the serverless architecture calls.

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b6877d2d-a8dd-4d2d-b4a3-32392d8896db)

- **Layers**-AWS Lambda Layers are a way to centrally manage code and data that is shared across multiple functions. You can create a layer that includes libraries, custom runtimes, or other function dependencies. This helps in keeping your function code small and focused, and it allows for easy updates to shared code.
- **Deafault invocation time in lambda is 3 seconds.**
