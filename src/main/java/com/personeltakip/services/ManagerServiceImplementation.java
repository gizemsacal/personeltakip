package com.personeltakip.services;

import java.util.List;

import com.personeltakip.model.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.personeltakip.model.Manager;
import com.personeltakip.repository.ManagerRepository;

@Service
@Transactional

class ManagerServiceImplementation implements ManagerService {
    @Autowired
    ManagerRepository managerRepository;

    @Override
    public List<Manager> getAllManagers(){
        return (List<Manager>) managerRepository.findAll();
    }

    @Override
    public Manager getManagerById(int id) {
        return managerRepository.findById(id).get();
    }

    @Override
    public void addManager(Manager manager) {
        managerRepository.save(manager);
    }

    @Override
    public void deleteManager(int id) {
        managerRepository.deleteById(id);
    }
}
