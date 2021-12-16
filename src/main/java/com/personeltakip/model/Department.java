package com.personeltakip.model;
import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "department")

public class Department {
    public Set<Project> getProject() {
        return project;
    }

    public void setProject(Set<Project> project) {
        this.project = project;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false, length = 40)
    private String name;

    @OneToMany(mappedBy = "department")
    private Set<Employee> employee;

    @OneToOne(mappedBy = "department")
    private Manager manager;

    @OneToMany(mappedBy = "department")
    private Set<Project> project;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Employee> getEmployee() {
        return employee;
    }

    public void setEmployee(Set<Employee> employee) {
        this.employee = employee;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

}

