package com.personeltakip.model;
import javax.persistence.Column;
import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name = "manager")

public class Manager {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name="firstname", nullable = false, length = 20)
    private String firstname;

    @Column(name="lastname", nullable = false, length = 30)
    private String lastname;

    @Column(name="email", nullable = false, length = 45)
    private String email;

    @Column(name="phone", nullable = false, length = 11)
    private String phone;

    @Column(name="gender", nullable = false, length = 1)
    private String gender;

    @Column(name="birthday", nullable = false )
    //@DateTimeFormat(pattern = "yyyy-MM-dd" )
    private java.sql.Date birthday;

    @OneToMany(mappedBy = "manager")
    private Set<Employee> employee;

    @OneToOne
    private Department department;

    @OneToMany(mappedBy = "manager")
    private Set<Project> project;

    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "user_id", nullable = true)
    private User user;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Set<Employee> getEmployee() {
        return employee;
    }

    public void setEmployee(Set<Employee> employee) {
        this.employee = employee;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Set<Project> getProject() {
        return project;
    }

    public void setProject(Set<Project> project) {
        this.project = project;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

