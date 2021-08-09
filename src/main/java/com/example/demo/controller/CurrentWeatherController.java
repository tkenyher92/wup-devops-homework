package com.example.demo.controller;

import com.example.demo.service.WeatherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CurrentWeatherController {

    private final WeatherService weatherService;

    public CurrentWeatherController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }

    @GetMapping("/current-weather")
    public String getCurrentWeather(Model model) {

        model.addAttribute("currentWeather", weatherService.getCurrentWeather("Budapest","hu"));
        return "current-weather";

    }
}
