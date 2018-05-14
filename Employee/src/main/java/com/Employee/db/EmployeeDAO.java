package com.Employee.db;

import java.util.List;

import org.hibernate.SessionFactory;

import com.Employee.core.Employee;
import com.google.common.base.Optional;

import io.dropwizard.hibernate.AbstractDAO;

public class EmployeeDAO extends AbstractDAO<Employee> {



    /**

     * Constructor.

     *

     * @param sessionFactory Hibernate session factory.

     */

    public EmployeeDAO(SessionFactory sessionFactory) {

        super(sessionFactory);

    }



    /**

     * Method returns all employees stored in the database.

     *

     * @return list of all employees stored in the database

     */

    @SuppressWarnings("unchecked")
	public List<Employee> findAll() {

        return list(namedQuery("com.Employee.core.Employee.findAll"));

    }



    /**

     * Looks for employees whose first or last name contains the passed

     * parameter as a substring.

     *

     * @param name query parameter

     * @return list of employees whose first or last name contains the passed

     * parameter as a substring.

     */

    @SuppressWarnings("unchecked")
	public List<Employee> findByName(String name) {

        StringBuilder builder = new StringBuilder("%");

        builder.append(name).append("%");

        return list(

                namedQuery("com.Employee.core.Employee.findByName")

                .setParameter("name", builder.toString())

        );

    }



    /**

     * Method looks for an employee by her id.

     *

     * @param id the id of an employee we are looking for.

     * @return Optional containing the found employee or an empty Optional

     * otherwise.

     */

    public Optional<Employee> findById(long id) {

        return Optional.fromNullable(get(id));

    }

}