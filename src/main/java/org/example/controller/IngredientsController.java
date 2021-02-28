package org.example.controller;

import org.example.model.Composition;
import org.example.model.Dish;
import org.example.model.Ingredients;
import org.example.repository.CompositionRepository;
import org.example.repository.DishesRepository;
import org.example.repository.IngredientsRepository;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
public class IngredientsController {

    private final IngredientsRepository ingredientsRepository;
    private final DishesRepository dishesRepository;
    private final CompositionRepository compositionRepository;

    public IngredientsController(IngredientsRepository ingredientsRepository, DishesRepository dishesRepository, CompositionRepository compositionRepository) {
        this.ingredientsRepository = ingredientsRepository;
        this.dishesRepository = dishesRepository;
        this.compositionRepository = compositionRepository;
    }


    @RequestMapping(value = "/ingredients", method = RequestMethod.GET)
    public String main(Model model) {
        model.addAttribute("Ingredients", ingredientsRepository.findAll());
        return "ingredients";
    }


    @RequestMapping(value = "/new_ingredient", method = RequestMethod.GET)
    public String newIngredient(Model model) {
        model.addAttribute("newIngredient", new Ingredients());
        return "new_ingredient";
    }


    @RequestMapping(value = "/new_ingredient/add", method = RequestMethod.POST)
    public String addIngredient(@Valid Ingredients ingredients) {
        ingredientsRepository.save(ingredients);
        return "redirect:/ingredients";
    }


    @RequestMapping(value = "/new_component/{id}", method = RequestMethod.GET)
    public String newComponent(@PathVariable Long id, Model model) {
        Dish  dish = dishesRepository.findById(id).get();
        List<Ingredients> ingredientsList = ingredientsRepository.findAll();
        Iterable<Composition> compositions = compositionRepository.findAll();
        model.addAttribute("Dish", dish);
        model.addAttribute("ingredientsList", ingredientsList);
        model.addAttribute("compositions", compositions);

        return "new_component";
    }


    @RequestMapping(value = "/new_component/add", method = RequestMethod.POST)
    public String newComponentAdd(
            @RequestParam String nameDish,
            @RequestParam String productName,
            @RequestParam Integer count,
            Map<String, Object> model) {

        Ingredients ingredientsList = ingredientsRepository.findByProductName(productName);
        Dish dish = dishesRepository.findByNameDish(nameDish);
        Composition composition = new Composition();
        composition.setDish(dish);
        composition.setIngredients(ingredientsList);
        composition.setCount(count);

        compositionRepository.save(composition);

        Iterable<Dish> dishesIterable = dishesRepository.findAll();
        dishesRepository.save(dish);

        Iterable<Composition> compositions = compositionRepository.findAll();

        model.put("addIngredient", dishesIterable);
        model.put("compositions", compositions);

        return "redirect:/new_component/" + dish.getId();
    }


    @RequestMapping(value = "/deleteI/{id}", method = RequestMethod.GET)
    @Transactional
    public String deleteIngredients(@PathVariable Long id) {
        ingredientsRepository.deleteById(id);
        return "redirect:/ingredients";
    }

}