package com.personeltakip.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.personeltakip.model.Department;
import com.personeltakip.services.DepartmentService;

@Controller
@RequestMapping(value="/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView model = new ModelAndView("department_list");
        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentList", departmentList);
        return model;
    }

    @RequestMapping(value="/addDepartment/", method=RequestMethod.GET)
    public ModelAndView addDepartment() {

        ModelAndView model = new ModelAndView();
        Department department = new Department();

        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentForm", department);
        model.setViewName("department_form");
        return model;
    }


    @RequestMapping(value = "/editDepartment/{id}", method = RequestMethod.GET)
    public ModelAndView editDepartment(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Department department = departmentService.getDepartmentById(id);
        model.addObject("departmentForm", department);

        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentList", departmentList);

        model.setViewName("department_form");
        return model;
    }

    @RequestMapping(value="/addDepartment", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("departmentForm") Department department) {

        departmentService.addDepartment(department);
        return new ModelAndView("redirect:/department/list");
    }

    @RequestMapping(value="/deleteDepartment/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        departmentService.deleteDepartment(id);
        return new ModelAndView("redirect:/department/list");
    }
}
