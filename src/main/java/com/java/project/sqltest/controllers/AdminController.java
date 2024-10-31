package com.java.project.sqltest.controllers;

import com.java.project.sqltest.dto.ChildsDto;
import com.java.project.sqltest.entities.Person;
import com.java.project.sqltest.services.ApartmentService;
import com.java.project.sqltest.services.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class AdminController {

    private final BuildingService buildingService;
    private final ApartmentService apartmentService;

    @Autowired
    public AdminController(BuildingService buildingService, ApartmentService apartmentService) {
        this.buildingService = buildingService;
        this.apartmentService = apartmentService;

    }

    @GetMapping("/get")
    public ResponseEntity<Map<Integer, List<Integer>>> showAll() {

        return ResponseEntity.ok(buildingService.show());

    }

    @GetMapping("/find")
    public ResponseEntity<List<ChildsDto>> child() {
        return ResponseEntity.ok(apartmentService.find());
    }

    @GetMapping("/{number}")
    public ResponseEntity<List<Person>> pers(@PathVariable("number") Integer number) {
        return ResponseEntity.ok(apartmentService.getPersons(number));
    }
}
