package com.example.ejbrest;

import java.util.List;

 


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import com.ejbrest.cloudapp.Person;

 

public class CustomerManager {

	
	@PersistenceContext
	private EntityManager emg;
	
	public EntityManager getEmg() {
		System.out.println("getting manager");
		return emg;
	}


	public void setEmg(EntityManager emg) {
		this.emg = emg;
	}


	public Customer getCustomer(int id) {
		System.out.println(emg.find(Customer.class, id).getName());
		return emg.find(Customer.class, id);
	}
	
	 
	public void addCustomers(List<Customer> customers) {
		for (Customer customer : customers) {
			emg.persist(customer);
		}
	}
	
	
	 
    public Person getPerson(Long id) {
        return emg.find(Person.class, id);
    }
    
    
    public Person savePerson(Person person) {
        if (person.getId() == null) {
            Person personToSave = new Person();
            personToSave.setName(person.getName());
            personToSave.setDescription(person.getDescription());
            personToSave.setImageUrl(person.getImageUrl());
            emg.persist(person);
        } else {
            Person personToUpdate = getPerson(person.getId());
            personToUpdate.setName(person.getName());
            personToUpdate.setDescription(person.getDescription());
            personToUpdate.setImageUrl(person.getImageUrl());
            person = emg.merge(personToUpdate);
        }

        return person;
    }
    
    
}
