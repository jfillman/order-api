# order-api

order-api - a Spring Boot application

Scaffolded by `SpringBootApplication` (idp-service-catalog). Java 21,
maven.

```
mvn spring-boot:run
```

Health check: `GET /actuator/health` (Spring Boot Actuator, enabled by default).

**CICD pipeline onboarding**: this app's `SpringBootApplication` resource carries a
`CicdOnboarded` condition tracking whether `platform-cicd`'s tenant-onboarding
ApplicationSet has picked up this app's committed tenant identity yet. See the
resource's own status for details.
