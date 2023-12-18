# maven-localstack

Maven building lambda functions.

Let's analyze the different sections of the [Okteto Manifest](https://www.okteto.com/docs/reference/manifest/):

## Build section

The images defined in the `build` section are:

- `maven`: uses `Dockerfile.maven` to build all the maven artifacts.
- `users`: depends on the image `maven`. The image built by `build-maven` is passed as a build argument. `Dockerfile.users` uses `OKTETO_BUILD_MAVEN_IMAGE` to `COPY` the maven artifacts. It pushes directly to the artifact registry.
- `users-acl`: depends on the image `maven`. The image built by `maven` is passed as a build argument. `Dockerfile.users-acl` uses `OKTETO_BUILD_MAVEN_IMAGE` to `COPY` the maven artifacts. It pushes directly to the artifact registry.
- `build.sls`: it's the image used for the `deploy` scripts. It installs the `sls` binaries, but it also depends on the image `maven`. This way, the deploy scripts will have access to `sls` and the maven artifacts.

Official docs for [build](https://www.okteto.com/docs/reference/manifest/#build-object-optional) section.

## Dependencies section

It deploys the repo https://github.com/pchico83/localstack and waits for its pods to be available. All the logic to deploy localstack could live in another repo.

Official docs for [dependencies](https://www.okteto.com/docs/reference/manifest/#dependencies-string-optional) section.

## Deploy section

The deploy section uses the image `OKTETO_BUILD_SLS_IMAGE`. It deploys the Kong configuration, the lambda functions, and uses `OKTETO_ENV` to configure the public endpoints of the lambda functions.
Official docs for [deploy](https://www.okteto.com/docs/reference/manifest/#deploy-remotely) section.

## External section

This is a nice to have, but it's a convenient way to show the lambda functions in the Okteto UI, with a custom endpoint, icon and `README.md`` file

Official docs for [external](https://www.okteto.com/docs/reference/manifest/#external-object-optional) section.
