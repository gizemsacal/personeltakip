package com.personeltakip.controller;

import com.personeltakip.model.Department;
import com.personeltakip.model.Manager;
import com.personeltakip.model.User;
import com.personeltakip.services.DepartmentService;
import com.personeltakip.services.ManagerService;
import com.personeltakip.services.UserService;

import com.personeltakip.services.UserService;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {

    @Autowired
    ManagerService managerService;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    UserService userService;

    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView model = new ModelAndView("manager_list");
        List<Manager> managerList = managerService.getAllManagers();
        model.addObject("managerList", managerList);
        return model;
    }

    @RequestMapping(value="/addManager/", method=RequestMethod.GET)
    public ModelAndView addManager() {

        ModelAndView model = new ModelAndView();
        Manager manager = new Manager();

        List<Manager> managerList = managerService.getAllManagers();
        model.addObject("managerForm", manager);

        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentList", departmentList);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList );

        model.setViewName("manager_form");
        return model;
    }


    @RequestMapping(value = "/editManager/{id}", method = RequestMethod.GET)
    public ModelAndView editManager(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Manager manager = managerService.getManagerById(id);
        model.addObject("managerForm", manager);

        List<Manager> managerList = managerService.getAllManagers();
        model.addObject("managerList", managerList);

        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentList", departmentList);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList );

        model.setViewName("manager_form");
        return model;
    }

    @RequestMapping(value="/addManager", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("managerForm") Manager manager) {

        managerService.addManager(manager);
        return new ModelAndView("redirect:/manager/list");
    }

    @RequestMapping(value="/deleteManager/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        managerService.deleteManager(id);
        return new ModelAndView("redirect:/manager/list");

    }
}
