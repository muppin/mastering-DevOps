### Amazon CloudFront (Global Service)
- Content Delivery Network (CDN)
- Improves read performance
- content is cached at the edge locations
- Improves users experience
- 216 Point of Presence globally (edge locations)
- DDoS protection (because worldwide), integration with Shield, AWS Web Application Firewall

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/0b1edc4c-8e9d-44ac-bf11-5f16d42799d4)

### BENIFITS OF USING CLOUDFRONT

- **Security** - Users are not accessing S3 bucket directly.
- **Cost** - Data transfer will cost less.
- **Latency** - Lowest latency as content is being cached.


### CloudFront – Origins
**S3 bucket**
- For distributing files and caching them at the edge
- Enhanced security with CloudFront Origin Access Control (OAC)
- OAC is replacing Origin Access Identity (OAI)
- CloudFront can be used as an ingress (to upload files to S3)
- ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/24cb2c69-30c4-4e57-ad7f-58fab2ede91b)


 **Custom Origin (HTTP)**
- Application Load Balancer
- EC2 instance
- S3 website (must first enable the bucket as a static S3 website)
- Any HTTP backend you want

  **OAC** - Virual role created for cloud front to access S3

 

