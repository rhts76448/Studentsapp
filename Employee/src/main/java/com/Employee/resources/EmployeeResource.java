package com.Employee.resources;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.Employee.core.Employee;
import com.Employee.db.EmployeeDAO;
import com.google.common.base.Optional;

import io.dropwizard.hibernate.UnitOfWork;
import io.dropwizard.jersey.params.LongParam;

@Path("/employee")

@Produces(MediaType.APPLICATION_JSON)

public class EmployeeResource {



    /**

     * The DAO object to manipulate employees.

     */

    private EmployeeDAO employeeDAO;



    /**

     * Constructor.

     *

     * @param employeeDAO DAO object to manipulate employees.

     */

    public EmployeeResource(EmployeeDAO employeeDAO) {

        this.employeeDAO = employeeDAO;

    }



    /**

     * Looks for employees whose first or last name contains the passed

     * parameter as a substring. If name argument was not passed, returns all

     * employees stored in the database.

     *

     * @param name query parameter

     * @return list of employees whose first or last name contains the passed

     * parameter as a substring or list of all employees stored in the database.

     */

    @GET

    @UnitOfWork

    public List<Employee> findByName(

            @QueryParam("name") Optional<String> name

    ) {

        if (name.isPresent()) {

            return employeeDAO.findByName(name.get());

        } else {

            return employeeDAO.findAll();

        }

    }



    /**

     * Method looks for an employee by her id.

     *

     * @param id the id of an employee we are looking for.

     * @return Optional containing the found employee or an empty Optional

     * otherwise.

     */

    @GET

    @Path("/{id}")

    @UnitOfWork

    public Optional<Employee> findById(@PathParam("id") LongParam id) {

        return employeeDAO.findById(id.get());

    }


}
