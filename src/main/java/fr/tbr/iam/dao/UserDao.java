package fr.tbr.iam.dao;

import java.util.List;

import fr.tbr.iam.model.Identity;

public interface UserDao {
	 
    void saveUser(Identity identity);
    
    List<Identity> findAllUsers();
    
    Identity findIdentityByName(String name);
    
    void deleteIdentity(String displayName);
    
    void updateIdentity (Identity identity);
    
    public Identity findIdentityByID(int id);
}
