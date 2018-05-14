package com.Employee;

import com.Employee.core.Employee;
import com.Employee.db.EmployeeDAO;
import com.Employee.resources.EmployeeResource;

import io.dropwizard.Application;
import io.dropwizard.db.DataSourceFactory;
import io.dropwizard.hibernate.HibernateBundle;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class EmployeeApplication extends Application<EmployeeConfiguration> {
	
	

    public static void main(final String[] args) throws Exception {
        new EmployeeApplication().run(args);
    }
	
    @Override
    public String getName() {
        return "Employee";
    }
    /**

     * Hibernate bundle.

     */

	private final HibernateBundle<EmployeeConfiguration> hibernateBundle
            = new HibernateBundle<EmployeeConfiguration>(
                    Employee.class) {
                @Override
                public DataSourceFactory getDataSourceFactory(
                        EmployeeConfiguration configuration) {
                			return configuration.getDataSourceFactory();
                			}
                };

    @Override
    public void initialize(final Bootstrap<EmployeeConfiguration> bootstrap) {
        // TODO: application initialization
    	bootstrap.addBundle(hibernateBundle);
    }

    @Override
    public void run(final EmployeeConfiguration configuration,
                    final Environment environment) {
        // TODO: implement application
    	final EmployeeDAO employeeDAO = new EmployeeDAO(hibernateBundle.getSessionFactory());
environment.jersey().register(new EmployeeResource(employeeDAO));
    }

}
