package org.example.controller;

import org.example.model.Dish;
import org.example.repository.DishesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class MenuController {

    DishesRepository dishesRepository;

    public MenuController(DishesRepository dishesRepository) {
        this.dishesRepository = dishesRepository;
    }

    @GetMapping("/")
    public String hello(){
        return "index";
    }

    @GetMapping("/new_dish")
    public String newDish(Model model){
        model.addAttribute("new_dish", new Dish());
        return "new_dish";
    }

    @RequestMapping(value = "/new_dish/add", method = RequestMethod.POST)
    public String addDishes(@Valid Dish dish){
        dishesRepository.save(dish);
        return "redirect:/menu";
    }

    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public String main(Model model) {

        List<Dish> sortedDishes = dishesRepository.findAll()
                .stream()
                .sorted()
                .collect(Collectors.toList());

        model.addAttribute("menuDishes", sortedDishes);
        return "menu";
    }



    @PostMapping("filter")
    public String filter(@RequestParam(required=false) String filter, Map<String, Object> model) {
        Iterable<Dish> dishesIterable;

        if (filter != null && !filter.isEmpty()) {
            dishesIterable = dishesRepository.findAllByNameDish(filter);
        } else {
            dishesIterable = dishesRepository.findAll();
        }
        model.put("menuDishes", dishesIterable);
        return "menu";
    }

}