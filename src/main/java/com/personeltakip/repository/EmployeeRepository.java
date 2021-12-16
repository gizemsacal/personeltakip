package com.personeltakip.repository;

import org.springframework.data.repository.CrudRepository;

import com.personeltakip.model.Employee;

public interface EmployeeRepository extends CrudRepository <Employee, Integer> {
}