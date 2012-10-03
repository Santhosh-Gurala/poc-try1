package com.ffe.common.framework.dao.hibernate;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Filter;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ffe.common.framework.dao.GenericDao;
import com.ffe.common.framework.model.AbstractDomain;
import com.ffe.common.framework.util.StringUtil;

/**
 * Generic Hibernate Abstract Class with implementation for the CRUD methods 
 *
 * @param <T>
 */
public  class GenericHibernateDAO<T extends AbstractDomain> implements
		GenericDao<T> {
	private static Logger logger = LoggerFactory.getLogger(GenericHibernateDAO.class);
	/**
	 * The type of the persistent entity
	 */
	private Class<T> persistentClass;
	
	
	/**
	 * Hibernate Session
	 */
	private Session session;

	/**
	 * Hibernate Session Factory
	 */
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * Constructor needs to be initialized from the Implementation class.
	 */
	public GenericHibernateDAO() {
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	/**
	 * Returns the Hibernate Session from the Session Factory based on getCurrentSession
	 * @return Hibernate Session 
	 */
	protected Session getSession() {
		if (sessionFactory == null)
			throw new IllegalStateException(
					"SessionFactory has not been set on DAO before usage");
		session = sessionFactory.getCurrentSession();
		Filter filter = session.enableFilter("deletedFlagFilter");
		filter.setParameter("deletedFlagFilterParam", "Y");
		return session;
	}


	/**
	 * 
	 * @return Class<T> - Returns the Persistent Entity Type
	 */
	public Class<T> getPersistentClass() {
		return persistentClass;
	}

    /**
     * Finds the Entity from the persistent store based on the Id
     * 
     * @param id - Unique ID of the Entity
     * @param lock - True locks and returns the entity, false otherwise
     * @param entityName - Entity name of the entity specified in the hbm mapping
     * @return - Entity from the persistent store
     */
	@SuppressWarnings("unchecked")
	public T findById(final Long id, boolean lock,final String entityName) {
		T entity= null;
		if(StringUtil.isNullorEmpty(entityName)){
			entity = (T) getSession().get(getPersistentClass(), id);
		}else{
			entity = (T) getSession().get(entityName, id);
		}
		return entity;
	}
	
	 /**
     * Finds the Entity from the persistent store based on the business key
     * 
     * @param key - Unique business key of the Entity
     * @param value - value for the business key     
     * @param entityName - Entity name of the entity specified in the hbm mapping
     * @return - Entity from the persistent store
     */
	@SuppressWarnings("unchecked")
	public T findByBusinessKey(final String key, final String value, final String entityName) {
		T entity= null;
		Session session = getSession();
		Criteria criteria;
		if(StringUtil.isNullorEmpty(entityName)){
			criteria = session.createCriteria(getPersistentClass());
		}else{
			criteria = session.createCriteria(entityName);
		}
		criteria.add(Restrictions.eq(key, value));
		entity = (T) criteria.uniqueResult();
		return entity;
	}

	/**
	 * Deletes the entity from the persistent store
	 * @param entity the element to delete from this set of elements.
	 */
	public void delete(T entity,final String entityName) {
		if(StringUtil.isNullorEmpty(entityName))
		{
			getSession().delete(entity);
		}else{
			getSession().delete(entityName,entity);
		}
		
	}

	/**
	 * Creates the entity in the persistent store
	 * @param entity the element to create in this set of elements.
	 */
	public T create(T entity,final String entityName) {
		//return makePersistent(entity,entityName);
		if(StringUtil.isNullorEmpty(entityName))
		{
			getSession().save(entity);
		}else{
			getSession().save(entityName,entity);
		}
		
		return entity;
		
	}

	/**
	 * Updates the entity in the persistent store
	 * @param entity the element to update in this set of elements.
	 */
	
	public T update(T entity,final String entityName) {
		//return makePersistent(entity,entityName);
			
			if(StringUtil.isNullorEmpty(entityName))
			{
				getSession().saveOrUpdate(entity);
			}else{
				getSession().saveOrUpdate(entityName,entity);
			}
			return entity;
	}
	
	
	/**
	 * Merges the entity in the persistent store
	 * @param entity the element to merge in this set of elements.
	 */
	public T merge(T entity,final String entityName) {
		
		if(StringUtil.isNullorEmpty(entityName))
		{
			getSession().merge(entity);
		}else{
			getSession().merge(entityName,entity);
		}

		return entity;
	}

	/**
	 * Private Method invoked from the create or update methods
	 * 
	 * @param entity
	 */
	private T makePersistent(T entity,final String entityName) {
		
		getSession().saveOrUpdate(entity);
		
		return entity;
	}

	@Override
	public List<T> getAll() {
		logger.debug("Inside GenericHibernateDAO.getAll");
		String className = getPersistentClass().getName();
		Query queryResult = getSession().createQuery("from "+className);		
		List values = (List <T>)queryResult.list();
		return values;
	}	
	
	@Override
	public List<T> listByParam(String parmName, List<?> parmList) {
		logger.debug("Inside GenericHibernateDAO.listByIds");
		String className = getPersistentClass().getName();
		Query queryResult = getSession().createQuery("from "+className + " where " +parmName +" in (:parmList)");
		queryResult.setParameterList("parmList", parmList);
		List values = (List <T>)queryResult.list();
		return values;
	}	
	
	@Override
	public List<T> getAll(String value) {
		logger.debug("Inside GenericHibernateDAO.getAll");
		String className = value;
		Query queryResult = getSession().createQuery("from "+className);
		List values = (List <T>)queryResult.list();
		return values;
	}
	@Override
	public List<T> getAll(final int startIndex,final int offset) {
		logger.debug("Inside GenericHibernateDAO.getAll");
		String className = getPersistentClass().getName();
		logger.debug("className--->"+className);
		Query queryResult = getSession().createQuery("from "+className);
		List values = (List <T>)queryResult.list();
		return values;
	}
	
}
