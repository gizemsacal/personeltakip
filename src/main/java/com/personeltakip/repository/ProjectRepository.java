package com.personeltakip.repository;

import org.springframework.data.repository.CrudRepository;

import com.personeltakip.model.Project;

public interface ProjectRepository extends CrudRepository <Project, Integer> {
}