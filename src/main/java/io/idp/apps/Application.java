package io.idp.apps;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @GetMapping("/")
    public String home() {
<<<<<<< HEAD
        return "order-api: Hello World!";
=======
        return "order-api: Hello!";
>>>>>>> 53ce7df30c5b79ff4191d85b618f175a2e2769a5
    }
}
