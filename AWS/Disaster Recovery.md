#### DR
- RTO is a measure of how quickly can your application recover after an outage
- RPO is a measure of the maximum amount of data loss that your application can tolerate.

#### High Availability
- MTTR - Mean time to recover
- MTBF - Mean time between failures

![image](https://github.com/muppin/mastering-DevOps/assets/56094875/81276285-8f5c-42a3-b9b6-6a93a37afff1)


## DR Strategies

1. **Backup and Restore** - Taking backup and recovering it on other region.
   ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b8f84fd5-68b9-401e-a563-ecbec33547a1)

   ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/b5619740-d2e0-4e52-a130-0f87cfdd0b2e)


2. **Pilot Light** - Only DB and storage is active, application code servers are kept idle. It will quickly provision the servers.
   ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/08fdc3e5-6755-4f92-8793-1f65fcda15ed)

3. **Warm Standby** - DR region will be functional but it will be a scsled down version of active region.
   ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/bf6df82e-7f2f-4f6d-a956-18a20c3ee164)

4. **Multisite active/active backup** - We can run application in both region simultaneously. It is most expensive with near zero downtime and minimal data loss.
   Hot standby - traffic will be only routed to one region.
   ![image](https://github.com/muppin/mastering-DevOps/assets/56094875/2f594c20-6347-40d8-a6ee-54ba5076b67f)

