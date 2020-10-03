/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package app.dao;

import app.model.User;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author muhamad.hadinata
 */
public class RegistrationDao {
    JdbcTemplate template;
    
    public void setTemplate(JdbcTemplate template) {    
        this.template = template;    
    }   
    
    public int save(User user){    
        String date = "";
        if(user.getDateofbirth() == "" || user.getDateofbirth() == null){
            date = null;
        }else{
            date = "'"+user.getDateofbirth()+"'";
        }
        
        String sql="insert into t_registration(mobile_no,first_name,last_name,dateofbirth,gender,email) "
                + "values('"+user.getMobileno()+"','"+user.getFirstname()+"','"+user.getLastname()+"',"+date+",'"+user.getGender()+"','"+user.getEmail()+"')";    
        return template.update(sql);    
    }   
    
    public List<User> getMobileNo(String no){    
        String sql="select * from t_registration where mobile_no like '%"+no+"%'";    
        return template.query(sql,new BeanPropertyRowMapper<User>(User.class));
            
    }
    
     public List<User> getEmail(String email){    
        String sql="select * from t_registration where email like '%"+email+"%'";    
        return template.query(sql,new BeanPropertyRowMapper<User>(User.class));
            
    }   
}
