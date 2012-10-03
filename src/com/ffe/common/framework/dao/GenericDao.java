package com.ffe.common.framework.dao;

import java.util.List;

import com.ffe.common.framework.model.AbstractDomain;

/**
 * Generic Dao Interface for the Domain
 *
 * @param <T> - for the Entity Type
 */
public interface GenericDao<T extends AbstractDomain> {
	
    /**
     * Finds the Entity from the persistent store based on the Id
     * 
     * @param id - Unique ID of the Entity
     * @param lock - True locks and returns the entity, false otherwise
     * @return - Entity from the persistent store
     */
    public T findById(final Long id, boolean lock,String string);
    
    /**
     * Finds the Entity from the persistent store based on the business key
     * 
     * @param key - Unique business key of the Entity
     * @param value - value for the business key     
     * @param entityName - Entity name of the entity specified in the hbm mapping
     * @return - Entity from the persistent store
     */
    public T findByBusinessKey(final String key, final String value, final String entityName);
    
	/**
	 * Deletes the entity from the persistent store
	 * @param entity the element to delete from this set of elements.
	 */
	public void delete(T entity,String string);

	/**
	 * Creates the entity in the persistent store
	 * @param entity the element to create in this set of elements.
	 */
	public T create(T entity,String string);
	
	/**
	 * Updates the entity in the persistent store
	 * @param entity the element to update in this set of elements.
	 */
	public T update(T entity,String string);

	/**
	 * Merge the entity in the persistent store
	 * @param entity the element to update in this set of elements.
	 */
	public T merge(T entity,String string);
	
	/**
	 * get all the entity in the persistent store 
	 */
	public List<T> getAll(String string);
	
	public List<T> getAll(final int startIndex,final int offset);

	public List<T> getAll();
	
	public List<T> listByParam(String parmName, List<?> parmList);

}
