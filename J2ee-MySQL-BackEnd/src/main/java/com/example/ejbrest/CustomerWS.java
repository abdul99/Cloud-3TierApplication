package com.example.ejbrest;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.ejbrest.cloudapp.PaginatedListWrapper;
import com.ejbrest.cloudapp.Person;

@Path("/customers")
@Stateless
@LocalBean
@Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
@Produces(MediaType.APPLICATION_JSON)
public class CustomerWS {

	@EJB
	private CustomerDAO customersDao;

	@GET
	@Path("/{id}")
	public Customer getCustomer(@PathParam("id") int id) {
		return customersDao.getCustomer(id);
	}
	
	@POST
	 
	 	public void addCustomers(List<Customer> customers) {
		customersDao.addCustomers(customers);
	}
	
	
	@POST
	@Path("add")
	public void addCustomer(Customer customer) {
		customersDao.addCustomer(customer);
	}
	
	
	
	
	 @GET
	  @Path("persons")
	    @Produces(MediaType.APPLICATION_JSON)
	    public PaginatedListWrapper listPersons(@DefaultValue("1")
	                                            @QueryParam("page")
	                                            Integer page,
	                                            @DefaultValue("id")
	                                            @QueryParam("sortFields")
	                                            String sortFields,
	                                            @DefaultValue("asc")
	                                            @QueryParam("sortDirections")
	                                            String sortDirections) {  
	    	
	    	
	    	return customersDao.listPersons(page, sortFields, sortDirections);
	        
	    }

	    @GET
	    @Path("persons/{id}")
	    public Person getPerson(@PathParam("id") Long id) {
	        return customersDao.getPerson(id);
	    }

	    @POST
	    @Path("persons")
	   // @TransactionAttribute(TransactionAttributeType.REQUIRED)
	    public Person savePerson(Person person) {
	        
	    	return customersDao.savePerson(person);
	    }

	    @DELETE
	    @Path("persons/{id}")
	    public void deletePerson(@PathParam("id") Long id) {
	    	 customersDao.deletePerson(id);
	    }
	    
	    
}
