package com.personeltakip.model;


import javax.persistence.Column;
import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name = "project")

public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false, length = 60)
    private String name;

    @Column(name = "startDate", nullable = false)
    private java.sql.Date startDate;

    @Column(name = "endDate", nullable = false)
    private java.sql.Date endDate;

    @Column(name = "status", nullable = false)
    private String status;

    @ManyToOne
    private Department department;

    @ManyToOne
    private Manager manager;

    @ManyToMany
    private Set<Employee> employee;

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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public Set<Employee> getEmployee() {
        return employee;
    }

    public void setEmployee(Set<Employee> employee) {
        this.employee = employee;
    }


}
