package org.example.controller;

import org.example.enume.EnumTable;
import org.example.model.Dish;
import org.example.model.Report;
import org.example.repository.DishesRepository;
import org.example.repository.IngredientsRepository;
import org.example.repository.ReportRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.Map;

@Controller
public class ReportController {

    ReportRepository reportRepository;
    DishesRepository dishesRepository;
    IngredientsRepository ingredientsRepository;

    public ReportController(ReportRepository reportRepository, DishesRepository dishesRepository, IngredientsRepository ingredientsRepository) {
        this.reportRepository = reportRepository;
        this.dishesRepository = dishesRepository;
        this.ingredientsRepository = ingredientsRepository;
    }

    @GetMapping("/report")
    public ModelAndView listReports() {
        return new ModelAndView("report")
                .addObject("Dishes", dishesRepository.findAll())
                .addObject("reportList", reportRepository.findAll());
    }

    @GetMapping("/new/report")
    public ModelAndView newReport() {
        return new ModelAndView("new_collection")
                .addObject("Dishes", dishesRepository.findAll())
                .addObject("reportList", reportRepository.findAll());
    }

    @PostMapping("/new/report")
    public String addReport(
            @RequestParam EnumTable table,
            @RequestParam(required = false, name="nameDish") String nameDish ,
            @RequestParam(required = false) Integer count,
            Map<String, Object> model) {

        LocalDateTime localDate = LocalDateTime.now();
        Dish dish = dishesRepository.findByNameDish(nameDish);
        Report report = new Report (table, dish, count, localDate);
        reportRepository.save(report);
        model.put("reportMessage", "Блюдо с названием " + nameDish + " добавлено!");
        return "redirect:/score";
    }
}
