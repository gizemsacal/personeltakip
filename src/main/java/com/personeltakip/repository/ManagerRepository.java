package com.personeltakip.repository;

import org.springframework.data.repository.CrudRepository;

import com.personeltakip.model.Manager;

public interface ManagerRepository extends CrudRepository <Manager, Integer> {
}