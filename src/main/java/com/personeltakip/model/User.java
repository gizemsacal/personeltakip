package com.personeltakip.model;
import com.sun.org.apache.xpath.internal.objects.XString;
import javax.persistence.Column;
import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user")

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "username", nullable = false, length = 20)
    private String username;

    @Column(name = "password", nullable = false, length = 20)
    private String password;

    @OneToOne(mappedBy = "user", cascade = CascadeType.REMOVE)
    @PrimaryKeyJoinColumn
    private Employee employee;

    @OneToOne(mappedBy = "user", cascade = CascadeType.REMOVE)
    @PrimaryKeyJoinColumn
    private Manager manager;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }


}