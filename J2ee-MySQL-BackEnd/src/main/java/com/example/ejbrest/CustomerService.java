package com.example.ejbrest;

 

import java.util.List;







import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

import com.ejbrest.cloudapp.Person;

 
@Stateless
@Path("/customersvc")
 
public class CustomerService {

	@Inject
	private CustomerManager customerManager;

	@GET
	@Path("/{id}")
	public Customer getCustomer(@PathParam("id") int id) {
		return customerManager.getCustomer(id);
	}
	
	@POST
	public void addCustomers(List<Customer> customers) {
		customerManager.addCustomers(customers);
	}
	
	 
	
	
	 @GET
	 @Path("/persons/{id}")
	 public Person getPerson(@PathParam("id") Long id) {
			return customerManager.getPerson(id);
		}
	 
	 
	 
	   @POST
	   @Path("/person")
	    public Person savePerson(Person person) {
	         System.out.println(person.getDescription());
	        return customerManager.savePerson(person);
	    }

	    	    
	    
	 
	
}

