package com.personeltakip.repository;
import com.personeltakip.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UsrRepository extends CrudRepository <User, Integer> {

}
