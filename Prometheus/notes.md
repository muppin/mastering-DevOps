- Prometheus - For monitoring
- Grafana - For visualization


### Prometheus

Prometheus is an open-source monitoring and alerting toolkit originally built at SoundCloud and now maintained by the Cloud Native Computing Foundation (CNCF). It is designed for monitoring highly dynamic containerized environments like Kubernetes.


#### Prometheus Architecture
![image](https://github.com/muppin/mastering-DevOps/assets/56094875/f6eba9f3-9350-4af5-829a-c77bcd0b4996)

- As you install prometheus, there is a component called prometheus server which has HTTP server, which collects data from k8s cluster. 
- K8s by default has a API server that exposes metrics, so if we access on apiserver/metrics, we will get all the info about the resources in k8s cluster.
- Prometheus will try to fetch the info from api server and stores it in **TSDB** (Time series database). TSDB stores info with respect to the timestamp, and it stores all the info in disk (HDD/SSD).
- Prometheus will push the alerts to alert manager, which then can trigger notifications (email, slack, pagerduty)



### Key Components of Prometheus:

1. **Time Series Database:**
   Prometheus stores time-series data, i.e., sequences of data points indexed by timestamps. These data points represent system metrics, performance indicators, or any other measurable data about the system being monitored.

2. **Data Retrieval:**
   It collects metrics from configured targets by periodically scraping HTTP endpoints. It supports multiple service discovery mechanisms for dynamically discovering and monitoring new services or instances.

3. **Query Language:**
   PromQL (Prometheus Query Language) allows users to perform complex queries on the collected data. This query language is powerful and flexible, enabling analysis, aggregation, and transformation of metrics.

4. **Alerting Rules:**
   Prometheus enables the definition of alerting rules based on the queried metrics. When a specified condition is met, it triggers alerts, allowing operators to be notified of potential issues or anomalies.

5. **Visualization and Integration:**
   While Prometheus has a basic built-in UI for querying and graphing metrics, it's commonly used with visualization tools like Grafana. Grafana provides more advanced visualization capabilities, allowing users to create comprehensive dashboards.

6. **Exporter Ecosystem:**
   Prometheus follows a pull-based model and is supported by a vast ecosystem of exporters. Exporters collect specific metrics from various systems, making them available for scraping by Prometheus. For example, there are exporters for databases, web servers, cloud services, etc.

### Use Cases:

- **Monitoring Containerized Environments:** Prometheus is especially well-suited for monitoring microservices-based architectures, container orchestration systems like Kubernetes, and cloud-native applications.
  
- **Infrastructure and Application Monitoring:** It can collect metrics related to CPU usage, memory, disk I/O, network traffic, application-specific performance metrics, and more.

- **Alerting and Incident Management:** With its alerting capabilities, Prometheus helps in identifying issues, notifying operators, and enabling swift incident response.

- **Performance Analysis and Debugging:** The ability to store historical data and execute complex queries allows for in-depth analysis of system performance and debugging of issues over time.

Prometheus has become a popular choice for DevOps and SRE (Site Reliability Engineering) teams due to its scalability, flexibility, and ability to provide comprehensive monitoring and observability in modern, dynamic, and distributed environments.




