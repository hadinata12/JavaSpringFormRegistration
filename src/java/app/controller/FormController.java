/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controller;

import app.dao.RegistrationDao;
import app.model.User;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

/**
 *
 * @author muhamad.hadinata
 */
@Controller
public class FormController {
    
    @Autowired    
    RegistrationDao dao;
    
     @RequestMapping(value = "/index", method = RequestMethod.GET)
     public String get(ModelMap model){
      System.out.print("MASUK INDEX");
       model.addAttribute("message", "0");
      return "index";
    }
     
     @RequestMapping(value = "/addUser", method = RequestMethod.POST)
     public String postdata(@ModelAttribute("user") User user,ModelMap model){
         if(user.getDateofbirth() == ""){
             user.setDateofbirth(null);
         }
         System.out.println("DAOOOO "+user.getDateofbirth());
         dao.save(user); 
         model.addAttribute("message", "1");
         return "index";
    }
     
    @RequestMapping(value="/getmobileno/{id}", method=RequestMethod.GET)
    public @ResponseBody String getMobileNo(@PathVariable String id, Model m){    
        List<User> user=dao.getMobileNo(id);    
        
        System.out.println("fdsfsdfsdfsdfsd" + user.size()); 
        String result = "true";
        if(user.size() > 0){
            result = "false";
        }
       return result; 
    }
    
    @RequestMapping(value="/getemail/{email}", method=RequestMethod.GET)
    public @ResponseBody String getEmail(@PathVariable String email, Model m){    
        List<User> user=dao.getEmail(email);    
        
        String result = "true";
        if(user.size() > 0){
            result = "false";
        }
       return result; 
    }    
}
