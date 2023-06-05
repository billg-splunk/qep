# Docker tips

Knowing `docker` is a really useful skill when you are testing out applications and providing samples to customers.

In the context of this exercise the most important aspect of `docker` you need to know is about the [Dockerfile](https://docs.docker.com/engine/reference/builder/). This file is used as a set of instructions, **executed in order**,  to build images. Those images are then used in kubernetes manifests to run the service.

There are a few commands you will want to think about when adding instrumentation to your `Dockerfile`

[RUN](https://docs.docker.com/engine/reference/builder/#run): This instructions lets you run something in the process of your build.

[CMD](https://docs.docker.com/engine/reference/builder/#cmd): This instruction (and there is only one, the last one) provides defaults for an executing container. You can interpret:
```
["python3", "main.py"]
```
as the same thing as running:
```
python3 main.py
```
at the command-line.

That should explain enough to think about when adding instrumentation to the configuration.