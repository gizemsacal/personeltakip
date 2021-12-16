package com.personeltakip.services;

import java.util.List;

import com.personeltakip.model.Manager;

public interface ManagerService {
    public List<Manager> getAllManagers();
    public Manager getManagerById(int id);
    public void addManager(Manager manager);
    public void deleteManager(int id);
}