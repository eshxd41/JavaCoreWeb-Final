package fr.tbr.iam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.tbr.iam.dao.UserDao;
import fr.tbr.iam.dao.UserDaoImpl;
import fr.tbr.iam.model.Identity;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	public void saveUser(Identity identity) {
		userDao.saveUser(identity);
	}

	public List<Identity> findAllUsers() {
		return userDao.findAllUsers();
	}

	public Identity findIdentityByName(String name) {
		return userDao.findIdentityByName(name);
	}

	public void updateIdentity(Identity identity) {
		Identity identity1 = userDao.findIdentityByID(identity.getId());
		if(identity1 != null){
			identity1.setDisplayName(identity.getDisplayName());
			identity1.setBirthDate(identity.getBirthDate());
			identity1.setEmail(identity.getEmail());
		}
		userDao.updateIdentity(identity1);
	}

	public void deleteIdentity(String displayName) {
		userDao.deleteIdentity(displayName);
	}
	
	public Identity findIdentityByID(int id){
		return userDao.findIdentityByID(id);
	}
}
