package com.qwerty;

import com.qwerty.health.TemplateHealthCheck;
import com.qwerty.resources.qwertyResource;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class qwertyApplication extends Application<qwertyConfiguration> {

    public static void main(final String[] args) throws Exception {
        new qwertyApplication().run(args);
 
    }

    @Override
    public String getName() {
        return "qwerty";
    }

    @Override
    public void initialize(final Bootstrap<qwertyConfiguration> bootstrap) {
        // TODO: application initialization
    }

    @Override
    public void run(final qwertyConfiguration configuration,
                    final Environment environment) {
        // TODO: implement application
    	final qwertyResource resource = new qwertyResource(
    	        configuration.getTemplate(),
    	        configuration.getDefaultName()
    	    );
    	final TemplateHealthCheck healthCheck =
    	        new TemplateHealthCheck(configuration.getTemplate());
    	    environment.healthChecks().register("template", healthCheck);
    	    environment.jersey().register(resource);


    }

}
