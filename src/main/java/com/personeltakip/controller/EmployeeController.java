package com.personeltakip.controller;

import com.personeltakip.model.Department;
import com.personeltakip.model.Employee;
import com.personeltakip.model.User;
import com.personeltakip.services.EmployeeService;
import com.personeltakip.services.DepartmentService;
import com.personeltakip.services.UserService;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@Controller
@RequestMapping(value="/employee")
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @Autowired
    DepartmentService departmentService;

    @Autowired
    UserService userService;

    @RequestMapping(value="/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView model = new ModelAndView("employee_list");
        List<Employee> employeeList = employeeService.getAllEmployees();
        model.addObject("employeeList", employeeList);
        return model;
    }

    @RequestMapping(value="/addEmployee/", method=RequestMethod.GET)
    public ModelAndView addEmployee() {

        ModelAndView model = new ModelAndView();
        Employee employee = new Employee();

        List<Employee> employeeList = employeeService.getAllEmployees();
        model.addObject("employeeForm", employee);

        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentList", departmentList);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList );

        model.setViewName("employee_form");
        return model;
    }


    @RequestMapping(value = "/editEmployee/{id}", method = RequestMethod.GET)
    public ModelAndView editEmployee(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Employee employee = employeeService.getEmployeeById(id);
        model.addObject("employeeForm", employee);

        List<Employee> employeeList = employeeService.getAllEmployees();
        model.addObject("employeeList", employeeList);

        List<Department> departmentList = departmentService.getAllDepartments();
        model.addObject("departmentList", departmentList);

        List<User> userList = userService.getAllUsers();
        model.addObject("userList", userList );


        model.setViewName("employee_form");
        return model;
    }

    @RequestMapping(value="/addEmployee", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("employeeForm") Employee employee) {

        employeeService.addEmployee(employee);
        return new ModelAndView("redirect:/employee/list");

    }

    @RequestMapping(value="/deleteEmployee/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        employeeService.deleteEmployee(id);
        return new ModelAndView("redirect:/employee/list");

    }
}
