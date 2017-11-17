package fr.tbr.iam.service;

import java.util.List;

import fr.tbr.iam.model.Identity;

public interface UserService {

	void saveUser(Identity identity);

	List<Identity> findAllUsers();
	
	Identity findIdentityByName(String name);
	
	void updateIdentity (Identity identity);
	
	void deleteIdentity(String displayName);
	
	Identity findIdentityByID(int id);

}
