## CloudWatch
**CloudWatch is a service which watches/monitors other services in AWS Cloud.**
### It Helps in understanding and implementing-
- Monitoring
- Alerting
- Reporting
- Logging

**It provides-**
- Real life metrics
- Log Insights
- Custom metrics
- Cost Optimization
- Scaling

### CloudWatch Metrics
- Is a variable to monitor.
- Metrics have a timestamp.
- Dimension is an attribute of a metric, can have upto 30 dimensions per metric. eg. (instance id, environment etc)
- CloudWatch metrics can be streamed in near-real time to Kinesis Data Firehose or any other 3rd party party service provider such as datadog, splunk.
- If u enable **Detailed Monitoring**, we can get data of every 1 minute.
  
### CloudWatch Logs
- **Log Groups** - Arbitary name, usually represents a group
- **Log stream** - Within a Log group we have log streams which represent instances within application/container/log files.
- All the logs are encrypted by default.

### CloudWatch LogInsights
- **Search and analyse data stored in ClodWatch Logs**
- with the help of query

### CloudWatch Log Subscription
- Get real time log events from CloudWatch logs for processing and analysis.

### CloudWatch Logs for EC2
- By default, no logs from your EC2 machine will go to CloudWatch.
- You need to run a CloudWatch agent on EC2 to push the log files you want.
- The CloudWatch log agent can be setup on-premises too

### CloudWatch Alarms
- Alarms are used to trigger notifications for any metric
- 


  
