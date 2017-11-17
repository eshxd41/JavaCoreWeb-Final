package fr.tbr.iam.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fr.tbr.iam.model.Identity;
import fr.tbr.iam.model.Login;
import fr.tbr.iam.service.UserService;

@Controller
@RequestMapping("/")
public class AppController {
	
	@Autowired
	UserService userService;
	     
    @Autowired
    MessageSource messageSource;
    
    private Logger logger = Logger.getLogger(AppController.class.getName());
    
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String renderApplication(ModelMap model){
    	Login login = new Login();
    	model.addAttribute("login", login);
    	model.addAttribute("register", false);
    	return "login";
    }
    @RequestMapping(value="/", method = RequestMethod.POST)
    public String validateLogin(@Valid Login login, BindingResult result, ModelMap model){
    	logger.info("Entering into validateLogin() method.");
    	List<Identity> userList = userService.findAllUsers();
    	if(result.hasErrors()){
    		logger.info("This will display when error Occoured");
    		return "login";
    	}else{
    		for(Identity identity : userList){
    			if(login.getUsername().equalsIgnoreCase(identity.getDisplayName()) && login.getPassword().equalsIgnoreCase(identity.getPassword())){
    				model.addAttribute("welcome", "Congratulations " +identity.getDisplayName() + ". You've logged in successfully!");
    				Login loginNew = new Login();
    		    	model.addAttribute("login", loginNew);
    				return "welcome";
    			}
    		}
    		model.addAttribute("error", true);
    		return "login";
    	}    	
    }
    /**
     * logger1
     * @param model
     * @return
     */
    @RequestMapping(value = { "/new" }, method = RequestMethod.GET)
    public String newIdentity(ModelMap model) {
    	logger.info("enterning into newIdentity() method.");
        Identity identity = new Identity();
        model.addAttribute("identity", identity);
        model.addAttribute("edit", false);
        return "registration";
    }
 
    /* logger2
     * This method will list all existing identities.
     */
    @RequestMapping(value = {"/list" }, method = RequestMethod.GET)
    public String listEmployees(ModelMap model) {
    	logger.info("This will List all the employees from the Iam_system");
        List<Identity> users = userService.findAllUsers();
        model.addAttribute("users", users);
        return "allemployees";
    }
    /*logger3
     * */
    @RequestMapping(value="/search",method=RequestMethod.POST)
    public String searchUserByName(@ModelAttribute("login") Login login, ModelMap model){
    	logger.info("This will display search options");
    	
    	String searchName = login.getUsername();
    	Identity identity = (Identity)userService.findIdentityByName(searchName);
    	if(searchName.equalsIgnoreCase(null) || searchName.isEmpty() || identity == null){
    		List<Identity> users = userService.findAllUsers();
    		model.addAttribute("users", users);
            return "allemployees";
    	}else{
    		
    		model.addAttribute("identity", identity);
    		return "searchResult";
    	}
    }
    
    @RequestMapping(value = { "/new" }, method = RequestMethod.POST)
    public String saveIdentity(@Valid Identity identity, BindingResult result,
            ModelMap model) {
 
        if (result.hasErrors()) {
            return "registration";
        }
        userService.saveUser(identity);
        model.addAttribute("register", false);
        model.addAttribute("success", "Idenity " + identity.getDisplayName() + " created successfully");
        return "success";
    }
 
    @RequestMapping(value = { "/edit-{displayName}-identity" }, method = RequestMethod.GET)
    public String editIdentity(@PathVariable String displayName, ModelMap model) {
        Identity identity = userService.findIdentityByName(displayName);
        model.addAttribute("identity", identity);
        model.addAttribute("edit", true);
        return "registration";
    }
    
    @RequestMapping(value = { "/edit-{displayName}-identity" }, method = RequestMethod.POST)
    public String updateIdentity(@Valid Identity identity, BindingResult result,
            ModelMap model, @PathVariable String displayName) {
 
        if (result.hasErrors()) {
            return "registration";
        }
        userService.updateIdentity(identity);
 
        model.addAttribute("success", "Identity " + identity.getDisplayName()  + " updated successfully");
        return "success";
    } 
     
    /*
     * This method will delete an identity.
     */
    @RequestMapping(value = { "/delete-{displayName}-identity" }, method = RequestMethod.GET)
    public String deleteIdentity(@PathVariable String displayName) {
        userService.deleteIdentity(displayName);
        return "redirect:/list";
    }
}
