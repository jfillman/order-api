FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app
RUN apk add --no-cache maven
COPY pom.xml ./
COPY src ./src
RUN mvn -q -DskipTests package

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
# apk upgrade runs after the jar COPY so kaniko's build cache (--cache-ttl=336h)
# can't keep replaying a stale OS-package layer across builds: an unchanged
# Dockerfile + unchanged base image otherwise gives this RUN the same cache key
# every time, so it never re-fetches newer alpine package versions. Placing it
# after COPY ties its cache key to the jar's content hash, which changes per commit.
RUN apk upgrade --no-cache
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
