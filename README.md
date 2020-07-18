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


### Issue and solution:
In the actual code http listener port was bound to loopback address 127.0.0.1 which will not serve the requests from outside of container, fixed issue by binding the port to all IP's "0.0.0.0"

### Multi-stage build, optimisation and non-root user:
Implemented multi-stage build by building and running the app in sperate stages in Dockerfile. This allowed to minimize the actual size of the final Docker container from 422MB to 13.6MB. And installing system packages required for project with no cache and static files in the beginning of the build reduced the build time. Finally files that should be ignored by the Docker client when generating a build context is achieved by adding dockerignore file which helps in speed up build, reduce the size of the container and secure the image.

When a Dockerfile doesn’t specify a USER, it defaults to executing the container using the root user. In practice, there are very few reasons why the container should have root privileges and it could very well manifest as a docker security issue. Since no user is specified in our actual code defined a user and group to run the application.

### Security
- 1. Minimal base image achieved by multi-stage and dockerignore list
- 2. Least privileged user achieved by creating and running the user by non-root user.
- 3. The given application is open to public so to mitigate this implemented token validation in the application.

### Running the application

1. Build application
```docker build -t gbaba/anztest1 .```

2. Starting Docker
```docker run -it -p 8000:8000 gbaba/anztest1```

3. Testing application
- without token
```curl -i http://localhost:8000/```
- output
    ```HTTP/1.1 403 Forbidden
    Date: Sat, 18 Jul 2020 09:53:16 GMT
    Content-Length: 0```

- with the token
```curl -i -H "anz-x-token: todo-this-token-value-has-to-be-implemented-properly" http://localhost:8000/```
- output
    ```HTTP/1.1 200 OK
    Date: Sat, 18 Jul 2020 09:52:51 GMT
    Content-Length: 13
    Content-Type: text/plain; charset=utf-8

    Hello, world.```
    




