Frequency of evaluation is the different time frames at which you want the alert rule to evaluate this condition.
Eg. 5 minutes

Aggregation Granularity is over how much period of time do you want take the metrics and see what is the aggregation type(average)

Static Thresholds- 
We can manually specify the thresholds.

Dynamic Thresholds-
	• Azure monitor will use ML to check the historical behaviour of metrics.
	• Based on historical data, it can then identify patterns and anomalies that could indicate possible issues.
	• Sensitivity-

	• High- Alert will be generated even for smaller deviation
	• Medium- more balanced thresholds and fewer alerts will be generated
	• Low- Alert will be generated only for larger deviation


Logs Analytics workspace- 
	• Resource for storing logs.
	• Central solution for all your logs.
	• Kusto query language can be used query the DB.
	• Collect data from the resources and query them accordingly.
	
	
Service Map-
	1. Discovery- Helps to discover application components on windows and linux systems.
	2. Log analytics- The machines need to be connected to a log analytic workspace.
	3. Information- you can see information such as connections between servers, latency for connections.
	4. Agent - The machine also need to have a dependency agent.

Virtual machine scale set notification-
	• Will get notify option only if auto scale is enable.
	• Will get diagnostic setting option only if auto scale is enable.

Application Insights- default way AI uses is logs analytics workspace.

	• You can see users, events and sessions.
	• Funnels- you can see multiple stages like pipeline.
	• Cohorts- set of users, events and sessions which have something in common, will help u to determine particular set of events.
	• Impact- You can see how load times and other aspects of your application impact the conversion rate for ur app.
	• Retention- helps to analyse how many users come back to your app.
	• User flows- help in answering useful questions such as- where users click most, repeated action
	• Smart detection feature- Will let you know in real time if any abnormalities in your app.

Container Instance probes-
Liveness probe-
Readiness probe


![Uploading image.png…]()
