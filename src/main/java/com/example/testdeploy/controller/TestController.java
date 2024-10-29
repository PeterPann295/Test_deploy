package com.example.testdeploy.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {
    @GetMapping("/test")
    public String test(){
        return "Haha deploy thanh cong roi thang lon";
    }
    @GetMapping("/getData")
    public String data(){
        return "Haha da lay data thanh cong roi thang lon";
    }
}
