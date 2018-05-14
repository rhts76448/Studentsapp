package com.Employee.core;

import javax.persistence.*;

@Entity

@Table(name = "employees")

@NamedQueries({

    @NamedQuery(name = "com.Employee.core.Employee.findAll",

            query = "select e from Employee e"),

    @NamedQuery(name = "com.Employee.core.Employee.findByName",

            query = "select e from Employee e "

            + "where e.firstName like :name "

            + "or e.lastName like :name")

})

public class Employee {



    /**

     * Entity's unique identifier.

     */

    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private long id;

    /**

     * employee first name.

     */

    @Column(name = "first_name")

    private String firstName;

    /**

     * employee last name.

     */

    @Column(name = "last_name")

    private String lastName;

    /**

     * employee position.

     */

    @Column(name = "e_position")

    private String position;

    /**

     * employee phone.

     */

    private String phone;

    /**

     * employee e-mail.

     */

    private String e_mail;



    /**

     * A no-argument constructor.

     */

    public Employee() {

    }



    /**

     * A constructor to create employees. Id is not passed, cause it's

     * auto-generated by RDBMS.

     *

     */

    public Employee(String firstName, String lastName, String position, String phone, String e_mail) {

        this.firstName = firstName;

        this.lastName = lastName;

        this.position = position;

        this.phone = phone;

        this.e_mail = e_mail;

    }



    // Auto-generated equald, hashCode, getters and setters.


  }