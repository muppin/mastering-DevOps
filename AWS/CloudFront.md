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

### How the content in edge locations gets updated?

 **Custom Origin (HTTP)**
- Application Load Balancer
- EC2 instance
- S3 website (must first enable the bucket as a static S3 website)
- Any HTTP backend you want

  **OAC** - Virual role created for cloud front to access S3

  Content in a Content Delivery Network (CDN) local cache is refreshed through a process called cache invalidation or cache purging. When content on the origin server (the server where the original content is hosted) is updated or changed, the CDN needs to ensure that the cached copies of that content across its network are also updated to reflect the changes.

Here's a general overview of how content in a CDN local cache is refreshed:

1. **Cache Invalidation/Purging:** When content on the origin server is updated, the CDN is notified of this change. This notification can occur through various mechanisms such as webhooks, API calls, or manual purging via a management interface provided by the CDN provider.

2. **Propagation:** Once the CDN receives the notification, it initiates the process of invalidating or purging the cached copies of the updated content across its network. This process typically involves sending commands to edge servers (the servers located in various geographical locations closer to the end-users) to remove the outdated content from their caches.

3. **Cache Replenishment:** After the outdated content is removed from the cache, the CDN fetches the updated content from the origin server. This updated content is then stored in the cache of the edge servers closest to the end-users, ensuring that subsequent requests for that content are served with the latest version.

4. **Time to Live (TTL):** Additionally, CDNs often utilize Time to Live (TTL) settings to control how long content remains cached before it expires. When the TTL for a piece of content expires, the CDN revalidates it with the origin server to check for updates. If the content has been modified, the CDN fetches the updated version and caches it again.

5. **Cache-Control Headers:** Cache-Control headers sent by the origin server can also influence how the CDN caches content. These headers specify directives for caching mechanisms in both requests and responses. For example, they can indicate whether content can be cached, and if so, for how long.

Overall, the process of refreshing content in a CDN's local cache involves a combination of cache invalidation, cache purging, propagation of updates to edge servers, and adherence to TTL settings and Cache-Control headers. This ensures that users receive the most up-to-date content efficiently from the nearest CDN edge server.

 

