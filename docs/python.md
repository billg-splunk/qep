# Python Tips

This training isn't about knowing Python, but this tips section will tell you some things that could be useful for the exercise.

## Bugs

To start the service you are supporting and instrumenting, **creditcheckservice**, has a bug in it.

You can find this issue either before you instrument it or after it. And if you find it in both places (which means you instrument first before figuring out the problem) then you can see both techniques.

If you want to do it before, try using the `kubectl logs` command on your pod.

If you do it after you will see the stack trace in traces.

## Requirements.txt

This python app uses `requirements.txt`. The documentation explains how to configure instrumentation when such a file is present.

## Bootstrapping

See the tips on [docker](docker.md) for a tip on bootstrapping, as well as launching the app.