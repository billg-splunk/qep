# Instrumentation Tips

These tips are split into two sections: auto-instrumentation, which you should do first before you do the exercise, and manual-instrumentation, which you will need to do as part of the exercise.

## Auto-instrumentation

You should be able to follow the instructions to get auto-instrumentation working.

Some of the nuances you may need to be aware of:
* Review the [docker](docker.md) for tips on how to setup your service build
* Review the [kubernetes](kubernetes.md) for tips on setting up your service environment
* Maybe the most important tip is about context propagation. The `paymentservice` uses `b3multi`. So you will need to add this to the default list of propagators for your service, `creditcheckservice`.

When your **creditcheckservice** is instrumented the logs will look something like the following:
```
2023-05-30 14:08:11,566 INFO [waitress] [wasyncore.py:486] [trace_id=0 span_id=0 resource.service.name=creditcheckservice trace_sampled=False] - Serving on http://0.0.0.0:8888
```

