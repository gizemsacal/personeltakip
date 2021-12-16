package com.personeltakip.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.personeltakip.model.Project;
import com.personeltakip.repository.ProjectRepository;

@Service
@Transactional

class ProjectServiceImplementation implements ProjectService {
    @Autowired
    ProjectRepository projectRepository;

    @Override
    public List<Project> getAllProjects(){
        return (List<Project>) projectRepository.findAll();
    }

    @Override
    public Project getProjectById(int id) {
        return projectRepository.findById(id).get();
    }

    @Override
    public void addProject(Project project) {
        projectRepository.save(project);
    }

    @Override
    public void deleteProject(int id) {
        projectRepository.deleteById(id);
    }
}
