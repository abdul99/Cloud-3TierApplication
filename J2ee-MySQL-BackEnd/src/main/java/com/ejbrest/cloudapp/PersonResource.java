package com.ejbrest.cloudapp;



import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;

import com.example.ejbrest.CustomerDAO;

import java.util.List;

/**
 * REST Service to expose the data to display in the UI grid.
 *
 * @author Roberto Cortez
 */
 
 

@Stateless
@LocalBean
@Path("persons")
@Consumes({MediaType.APPLICATION_JSON,MediaType.APPLICATION_XML})
@Produces(MediaType.APPLICATION_JSON)
public class PersonResource  {
	@EJB
	private CustomerDAO personDao;
	
	

   

    @GET
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
    	
    	
    	return personDao.listPersons(page, sortFields, sortDirections);
        
    }

    @GET
    @Path("{id}")
    public Person getPerson(@PathParam("id") Long id) {
        return personDao.getPerson(id);
    }

    @POST
   // @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public Person savePerson(Person person) {
        
    	return personDao.savePerson(person);
    }

    @DELETE
    @Path("{id}")
    public void deletePerson(@PathParam("id") Long id) {
    	 personDao.deletePerson(id);
    }
}
