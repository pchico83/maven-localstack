ARG OKTETO_BUILD_MAVEN_IMAGE
FROM ${OKTETO_BUILD_MAVEN_IMAGE} as maven-build

FROM XXXX

WORKDIR /app

COPY --from=maven-build /code/target/*.jar .
