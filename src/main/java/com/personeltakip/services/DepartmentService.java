package com.personeltakip.services;
import java.util.List;
import com.personeltakip.model.Department;

public interface DepartmentService {
    public List<Department> getAllDepartments();
    public Department getDepartmentById(int id);
    public void addDepartment(Department department);
    public void deleteDepartment(int id);
}