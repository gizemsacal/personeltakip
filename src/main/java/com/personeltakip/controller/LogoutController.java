package com.personeltakip.controller;

import com.personeltakip.model.Manager;
import com.personeltakip.model.User;
import com.personeltakip.services.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

@Controller

public class LogoutController {
    @Autowired
    ManagerService managerService;

    @RequestMapping(value="/logout", method= RequestMethod.POST)

    public ModelAndView logout(HttpSession request){
        User user = (User) request.getAttribute("user");
        Manager manager = (Manager) request.getAttribute("manager");

        for (Manager manager1: managerService.getAllManagers())
        {
            if (manager1.getUser().getId() == user.getId() )
            {
                request.removeAttribute("user");
                request.removeAttribute("manager");
                return new ModelAndView("redirect:/employee_login");
            }
        }

        request.removeAttribute("user");
        request.removeAttribute("employee");

        return new ModelAndView("redirect:/employee_login");

    }
}