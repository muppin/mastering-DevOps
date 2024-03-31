## Route 53

## DNS

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/cbab1cca-7c15-4cce-80a2-482d3dac0c7d)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b81b79b0-3c18-4480-aea0-e7da63c25823)


**What is Amazon route 53?**
it performs 3 main functions
- if a website needs a name, route 53 registers a name for the website(domain name)
- Route 53 helps to connect the browser(client) to the website(server), when the user enter the domain name.
- Route 53 checks the health of the resources by sending automated requests

 ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/f4e88654-0374-4347-86c7-3959d046fc63)

 ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/621e4634-05ad-4fdb-bd64-50927527c5e5)

 ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/7c514000-2c2d-41b5-a87a-d4933423713a)

### Benefits of using route 53

![image](https://github.com/muppin/mastering-DevOps/assets/121821200/68055e8f-78bb-4067-9211-3e74d1ad9d0d)



### Steps to create hosted zone
- Create hosted zone.
- By default NS and SOA records will be created.
- Now copy NS records from hosted zone to Registered Domain.
- Then create A name record.

  ## TTL

  ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/4d7664f2-6e02-490a-9aaa-eff5f7442b13)


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


![image](https://github.com/muppin/mastering-DevOps/assets/56094875/f72e3a81-1fa1-4b8a-9809-a07b1f1ca93e)

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/03a8b610-f77c-4d44-9b0e-e0afe86dd04b)

you can't set TTL for ALIAS record

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/003036b3-fa1b-45c2-a4ef-8a1c6ade98a0)




