## AWS Secrets Manager

- Secrets manager are used to store critical credentials.
- It helps in rotating the credentials.
- you can make use of dufferent services like systems manager, secrets managers to store the secrets
    - take an example, the docker username and registry url is not that sensitive can be stored in systems manager.
    - you can store docker password, api tokens which are highly sensitive, here we can make use of secrets manager, where it offers certain luxuries like rotation of passwords, custom secret roatation, highly secure.
    - its best practice to go with the combined solution, because secrets manager is of higher price, and keeping cost optimization in mind
 
### Hashicorp vault

- its a dedicated vault storage
- community driven
- has many features compared to aws offerings.
- used for multicloud purpose.
