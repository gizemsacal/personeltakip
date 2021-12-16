package com.personeltakip.repository;

import org.springframework.data.repository.CrudRepository;

import com.personeltakip.model.Department;

public interface DepartmentRepository extends CrudRepository <Department, Integer> {
}