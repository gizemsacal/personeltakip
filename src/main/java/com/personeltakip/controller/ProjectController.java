package com.personeltakip.controller;

import com.personeltakip.model.Department;
import com.personeltakip.model.Manager;
import com.personeltakip.model.Employee;
import com.personeltakip.model.Project;

import com.personeltakip.services.DepartmentService;
import com.personeltakip.services.ManagerService;
import com.personeltakip.services.EmployeeService;
import com.personeltakip.services.ProjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import java.util.List;


@Controller
@RequestMapping(value="/project")
public class ProjectController {

    @Autowired
    ProjectService projectService;

    @Autowired
    ManagerService managerService;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView model = new ModelAndView("project_list");
        List<Project> projectList = projectService.getAllProjects();
        model.addObject("projectList", projectList);

        return model;
    }

    @RequestMapping(value="/addProject/", method=RequestMethod.GET)
    public ModelAndView addProject() {

        ModelAndView model = new ModelAndView();
        Project project = new Project();

        List<Project> projectList = projectService.getAllProjects();
        model.addObject("projectForm", project);

        List<Employee> employeeList = employeeService.getAllEmployees();
        model.addObject("employeeList", employeeList);

        List<Manager> managerList = managerService.getAllManagers();
        model.addObject("managerList", managerList);

        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentList", departmentList);

        model.setViewName("project_form");
        return model;
    }


    @RequestMapping(value = "/editProject/{id}", method = RequestMethod.GET)
    public ModelAndView editManager(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Project project = projectService.getProjectById(id);
        model.addObject("projectForm", project);

        List<Employee> employeeList = employeeService.getAllEmployees();
        model.addObject("employeeList", employeeList);

        List<Manager> managerList = managerService.getAllManagers();
        model.addObject("managerList", managerList);

        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentList", departmentList);

        model.setViewName("project_form");
        return model;
    }

    @RequestMapping(value="/addProject", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("projectForm") Project project) {
        projectService.addProject(project);
        return new ModelAndView("redirect:/project/list");
    }

    @RequestMapping(value="/deleteProject/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        projectService.deleteProject(id);
        return new ModelAndView("redirect:/project/list");

    }
}
