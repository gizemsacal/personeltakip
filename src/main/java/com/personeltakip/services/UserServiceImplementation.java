package com.personeltakip.services;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.personeltakip.model.User;
import com.personeltakip.repository.UsrRepository;

@Service
@Transactional

class UserServiceImplementation implements UserService {
    @Autowired
    UsrRepository usrRepository;

    @Override
    public List<User> getAllUsers(){ return (List<User>) usrRepository.findAll(); }

    @Override
    public User getUserById(int id) { return usrRepository.findById(id).get();}

    @Override
    public void addUser(User user) { usrRepository.save(user);}

    @Override
    public void deleteUser(int id) { usrRepository.deleteById(id); }
}
