package com.java.project.sqltest.services;

import com.java.project.sqltest.entities.Apartment;
import com.java.project.sqltest.entities.Building;
import com.java.project.sqltest.repositories.BuildingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class BuildingService {

    private final BuildingRepository buildingRepository;

    @Autowired
    public BuildingService(BuildingRepository buildingRepository) {
        this.buildingRepository = buildingRepository;
    }

    public Map<Integer, List<Integer>> show() {
        final var builds = buildingRepository.findAll();
        final var res = builds.stream()
                .collect(Collectors.toMap(
                        Building::getNumber,
                        building -> building.getApartments().stream()
                                .filter(apartment -> apartment.getFamily().stream()
                                        .filter(person -> person.getAge() < 18)
                                        .count() >= 2)
                                .map(Apartment::getNumber)
                                .collect(Collectors.toList())
                ));
        res.entrySet().removeIf(entry -> entry.getValue().isEmpty());
        return res;
    }


}
