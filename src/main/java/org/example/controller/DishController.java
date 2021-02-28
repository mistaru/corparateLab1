package org.example.controller;

import org.example.model.Dish;
import org.example.repository.DishesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class DishController {

    DishesRepository dishesRepository;

    public DishController(DishesRepository dishesRepository) {
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
    public String listDishes(Model model) {

        List<Dish> sortedDishes = dishesRepository.findAll()
                .stream()
                .sorted()
                .collect(Collectors.toList());

        model.addAttribute("menuDishes", sortedDishes);
        return "dish_list";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @Transactional
    public String deleteDishes(@PathVariable Long id) {
        dishesRepository.deleteById(id);
        return "redirect:/menu";
    }

    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    @Transactional
    public String detailsDish(@PathVariable Long id, Model model) {
        Dish dish = dishesRepository.findById(id).get();

        model.addAttribute("list", dish.getCompositions());
        model.addAttribute("dish", dish );
        return "details_dish";
    }

  /*  @PostMapping("filter")
    public String filter(@RequestParam(required=false) String filter, Map<String, Object> model) {
        Iterable<Dish> dishesIterable;

        if (filter != null && !filter.isEmpty()) {
            dishesIterable = dishesRepository.findAllByNameDish(filter);
        } else {
            dishesIterable = dishesRepository.findAll();
        }
        model.put("menuDishes", dishesIterable);
        return "dish_list";
    }
*/
}