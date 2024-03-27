## Route 53

## DNS

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/cbab1cca-7c15-4cce-80a2-482d3dac0c7d)

![Uploading image.png…]()



**What is Amazon route 53?**
it performs 3 main functions
- if a website needs a name, route 53 registers a name for the website(domain name)
- Route 53 helps to connect the browser(client) to the website(server), when the user enter the domain name.
- Route 53 checks the health of the resources by sending automated requests

### Benefits of using route 53

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/68055e8f-78bb-4067-9211-3e74d1ad9d0d)

### Different types of routing policies
When you create a record, you choose a routing policy, which determines how Amazon Route 53 responds to queries:

- Simple routing policy – Use for a single resource that performs a given function for your domain, for example, a web server that serves content for the example.com website. You can use simple routing to create records in a private hosted zone.

- Failover routing policy – Use when you want to configure active-passive failover. You can use failover routing to create records in a private hosted zone.

- Geolocation routing policy – Use when you want to route traffic based on the location of your users. You can use geolocation routing to create records in a private hosted zone.

- Geoproximity routing policy – Use when you want to route traffic based on the location of your resources and, optionally, shift traffic from resources in one location to resources in another location.

- Latency routing policy – Use when you have resources in multiple AWS Regions and you want to route traffic to the Region that provides the best latency. You can use latency routing to create records in a private hosted zone.

- IP-based routing policy – Use when you want to route traffic based on the location of your users, and have the IP addresses that the traffic originates from.

- Multivalue answer routing policy – Use when you want Route 53 to respond to DNS queries with up to eight healthy records selected at random. You can use multivalue answer routing to create records in a private hosted zone.

- Weighted routing policy – Use to route traffic to multiple resources in proportions that you specify. You can use weighted routing to create records in a private hosted zone.

### key features of Route 53

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/a8a3122f-7ad9-42e9-8b3e-cdff09fc2cc9)

