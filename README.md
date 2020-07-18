# Test 1

The following test will require you to do the following:
- Convert the current Dockerfile into a multistage build Dockerfile.
- Optimise Dockerfile for caching benefits.

There are many benefits to using multi-stage build techniques when creating Dockerfiles. One such benefit is mitigating security risks, this is accomplished
because the attack surface size of the image can be greatly reduced when the image no longer contains unnecessary files, packages, or binaries. It can
also enhance caching on layers in previous build steps that no longer need to be clustered in a single RUN statement for optimal layering because the
image is discarded and only those artifacts necessary are kept.

The final multi-stage Dockerfile should only have the essential components. You should also consider optimisation for caching, and structure in your final
solution.

The below Dockerfile in its current state does not compile - you will also need to debug this issue and consider how this can be resolved.
