package com.example.ejbrest;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;

import com.ejbrest.cloudapp.PaginatedListWrapper;
import com.ejbrest.cloudapp.Person;

@Stateless
@LocalBean
public class CustomerDAO {

	@PersistenceContext
	private EntityManager entityManager;
	
	public Customer getCustomer(int id) {
		//SystentityManager.out.println(entityManager.find(Customer.class, id).getName());
		return entityManager.find(Customer.class, id);
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void addCustomers(List<Customer> customers) {
		for (Customer customer : customers) {
			entityManager.persist(customer);
		}
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void addCustomer(Customer customer) {
		 
			entityManager.persist(customer);
		 
	}
	
	  private Integer countPersons() {
	        Query query = entityManager.createQuery("SELECT COUNT(p.id) FROM Person p");
	        return ((Long) query.getSingleResult()).intValue();
	    }

	    @SuppressWarnings("unchecked")
	    private List<Person> findPersons(int startPosition, int maxResults, String sortFields, String sortDirections) {
	        Query query =
	                entityManager.createQuery("SELECT p FROM Person p ORDER BY p." + sortFields + " " + sortDirections);
	        query.setFirstResult(startPosition);
	        query.setMaxResults(maxResults);
	        return query.getResultList();
	    }

	    public PaginatedListWrapper findPersons(PaginatedListWrapper wrapper) {
	        wrapper.setTotalResults(countPersons());
	        int start = (wrapper.getCurrentPage() - 1) * wrapper.getPageSize();
	        wrapper.setList(findPersons(start,
	                                    wrapper.getPageSize(),
	                                    wrapper.getSortFields(),
	                                    wrapper.getSortDirections()));
	        return wrapper;
	    }

	    
	    public PaginatedListWrapper listPersons(@DefaultValue("1")
	                                            @QueryParam("page")
	                                            Integer page,
	                                            @DefaultValue("id")
	                                            @QueryParam("sortFields")
	                                            String sortFields,
	                                            @DefaultValue("asc")
	                                            @QueryParam("sortDirections")
	                                            String sortDirections) {
	        PaginatedListWrapper paginatedListWrapper = new PaginatedListWrapper();
	        paginatedListWrapper.setCurrentPage(page);
	        paginatedListWrapper.setSortFields(sortFields);
	        paginatedListWrapper.setSortDirections(sortDirections);
	        paginatedListWrapper.setPageSize(10);
	        return findPersons(paginatedListWrapper);
	    }

	   
	    public Person getPerson(@PathParam("id") Long id) {
	        return entityManager.find(Person.class, id);
	    }

	    @TransactionAttribute(TransactionAttributeType.REQUIRED)
	    public Person savePerson(Person person) {
	        if (person.getId() == null) {
	            Person personToSave = new Person();
	            personToSave.setName(person.getName());
	            personToSave.setDescription(person.getDescription());
	            personToSave.setImageUrl(person.getImageUrl());
	            entityManager.persist(person);
	        } else {
	            Person personToUpdate = getPerson(person.getId());
	         //   SystentityManager.out.println("posting " + person.getId());
	            personToUpdate.setName(person.getName());
	            personToUpdate.setDescription(person.getDescription());
	            personToUpdate.setImageUrl(person.getImageUrl());
	            person = entityManager.merge(personToUpdate);
	        }

	        return person;
	    }

	    @TransactionAttribute(TransactionAttributeType.REQUIRED) 
	    public void deletePerson(@PathParam("id") Long id) {
	        entityManager.remove(getPerson(id));
	    } 
}
