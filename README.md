
# Overview

This repo contains the following for performance testing 

* [Bash Script](pt.sh) that invokes the endpoit n times and prints out the avg response times.
```
oc rsh <pod-name>  (ssh into the pod)

./pt.sh http://service-name 20  (Invoke script to call the url 20 times)
 ```


* [Jmeter image](Dockerfile) that executes the test plan using the jmeter cli and logs the summary report
  - [Sample jmx test plan](perftest.jmx) - This needs to be replaced by the jmx script currently being used
  - [Sample summary report](result.jtl) - This is just a sample. This can be opened in the GUI to get formatted readable report. This will be available in '/opt/perf' directory inside the container
  - [Startup script](starttest.sh) that kicks of the jmeter test inside the docker
