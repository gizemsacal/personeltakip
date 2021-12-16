package com.personeltakip.services;

import java.util.List;

import com.personeltakip.model.Project;

public interface ProjectService {
    public List<Project> getAllProjects();
    public Project getProjectById(int id);
    public void addProject(Project project);
    public void deleteProject(int id);
}