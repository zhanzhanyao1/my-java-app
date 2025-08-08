package com.example.controller;

import com.example.model.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

@Slf4j
@RestController
@RequestMapping("/users")
public class UserController {

    private final Map<Long, User> userMap = new HashMap<>();
    private final AtomicLong idCounter = new AtomicLong(1);

    @GetMapping
    public List<User> getAllUsers() {
        // log.info("Fetching all users");
        return new ArrayList<>(userMap.values());
    }
}