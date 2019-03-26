#!/bin/bash

oc new-build --strategy docker --binary --name=perf
oc start-build perf --from-dir . --follow
oc new-app perf