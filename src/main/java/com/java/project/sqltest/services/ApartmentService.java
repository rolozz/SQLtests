package com.java.project.sqltest.services;

import com.java.project.sqltest.dto.ChildsDto;
import com.java.project.sqltest.entities.Person;
import com.java.project.sqltest.repositories.ApartmentRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class ApartmentService {

    ApartmentRepository apartmentRepository;

    public List<ChildsDto> find() {
        return apartmentRepository.findAllByAge().stream()
                .map(i -> new ChildsDto(i.getBuilding().getNumber(), i.getNumber()))
                .collect(Collectors.toList());
    }

    public List<Person> getPersons(Integer number) {
        return apartmentRepository.findByNumber(number).stream()
                .flatMap(i -> i.getFamily().stream())
                .collect(Collectors.toList());
    }

}
