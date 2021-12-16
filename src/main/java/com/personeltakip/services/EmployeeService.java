package com.personeltakip.services;
import java.util.List;
import com.personeltakip.model.Employee;

public interface EmployeeService {
    public List<Employee> getAllEmployees();
    public Employee getEmployeeById(int id);
    public void addEmployee(Employee employee);
    public void deleteEmployee(int id);
}