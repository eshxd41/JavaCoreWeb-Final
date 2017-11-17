package fr.tbr.iam.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fr.tbr.iam.model.Identity;

@Repository("userDao")
@Transactional
public class UserDaoImpl extends AbstractDao<Integer, Identity> implements
		UserDao {

	public void saveUser(Identity identity) {
		int random = (int)(Math.random()*100);
		identity.setId(random);
		persist(identity);
	}

	@SuppressWarnings("unchecked")
	public List<Identity> findAllUsers() {
		Criteria criteria = createEntityCriteria();
		return (List<Identity>) criteria.list();
	}

	public Identity findIdentityByName(String name) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("displayName", name));
		return (Identity) criteria.uniqueResult();
	}
/*
 * (non-Javadoc)
 * @see fr.tbr.iam.dao.UserDao#findIdentityByID(int)
 */
	public Identity findIdentityByID(int id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("id", id));
		return (Identity) criteria.uniqueResult();
	}
/*
 * (non-Javadoc)
 * @see fr.tbr.iam.dao.UserDao#deleteIdentity(java.lang.String)
 */
	public void deleteIdentity(String displayName) {
		Query query = getSession().createSQLQuery(
				"delete from IDENTITIEES where IDENTITY_DISPLAY_NAME = :displayName");
		query.setString("displayName", displayName);
		query.executeUpdate();
	}
	
	public void updateIdentity (Identity identity){
		saveOrUpdate(identity);
	}

}
