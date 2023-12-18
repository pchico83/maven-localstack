# maven-localstack

Maven building lambda functions.

Let's analyze the different sections of the [Okteto Manifest](https://www.okteto.com/docs/reference/manifest/):

## Build section

The images defined in the `build` section are:

- `maven`: uses `Dockerfile.okteto` to build all the maven artifacts.
- `users`: multi-state build that depends on the maven build.
- `users-acl`: multi-state build that depends on the maven build.
- `sls`: it's the image used for the `deploy` scripts. It installs the `sls` binaries, but it's also a multi-state build that depends on the maven build.

Official docs for [build](https://www.okteto.com/docs/reference/manifest/#build-object-optional) section.

## Dependencies section

It deploys the repo https://github.com/pchico83/localstack and waits for its pods to be available. All the logic to deploy localstack could live in another repo.

Official docs for [dependencies](https://www.okteto.com/docs/reference/manifest/#dependencies-string-optional) section.

## Deploy section

The deploy section uses the image `OKTETO_BUILD_SLS_IMAGE`. It deploys the Kong configuration and the lambda functions.

Official docs for [deploy](https://www.okteto.com/docs/reference/manifest/#deploy-remotely) section.

## External section

This is a nice to have, but it's a convenient way to show the lambda functions in the Okteto UI, with a custom endpoint, icon and `README.md`` file.

Official docs for [external](https://www.okteto.com/docs/reference/manifest/#external-object-optional) section.
