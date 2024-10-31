package com.java.project.sqltest.repositories;

import com.java.project.sqltest.entities.Apartment;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ApartmentRepository extends JpaRepository<Apartment, Long> {

    @Transactional(readOnly = true)
    @EntityGraph(attributePaths = {"building", "family"})
    @Query("""
                SELECT a 
                FROM apartment a 
                WHERE a.id IN (
                    SELECT aSub.id 
                    FROM apartment aSub 
                    JOIN aSub.family f 
                    WHERE f.age < 18 
                    GROUP BY aSub.id 
                    HAVING COUNT(f.id) >= 2
                )
            """)
    List<Apartment> findAllByAge();

    @EntityGraph(attributePaths = {"building", "family"})
    @Query("""
                SELECT a 
                FROM apartment a
                WHERE a.number = :number
            """)
    List<Apartment> findByNumber(@Param("number") Integer number);


}
