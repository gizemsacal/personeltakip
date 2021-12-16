package com.personeltakip.services;

import java.util.List;
import com.personeltakip.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.personeltakip.repository.DepartmentRepository;

@Service
@Transactional
class DepartmentServiceImplementation implements DepartmentService {

    @Autowired
    DepartmentRepository departmentRepository;

    @Override
    public List<Department> getAllDepartments(){
        return (List<Department>) departmentRepository.findAll();
    }

    @Override
    public Department getDepartmentById(int id) {
        return departmentRepository.findById(id).get();
    }

    @Override
    public void addDepartment(Department department) {
        departmentRepository.save(department);
    }

    @Override
    public void deleteDepartment(int id) {
        departmentRepository.deleteById(id);
    }
}
