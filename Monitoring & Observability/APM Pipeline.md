## Application Performance Monitoring Pipeline

- Firstly there should be a monitoring solution configured such as site24*7 OR Grafana.
- Then we have app hosting inside a POD, there should be an APM agent.
- This APM agent will collect the metric sfro the app and send it to Grafana/site24*7.
- APM will collect the metrics and push it so this a push based model.

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/ea0e7df3-70d4-4c2b-81c3-0eaa4cf3bbf9)
