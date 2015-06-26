/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
/**
 *
 * @author Arif
 */
public class UserLogin {
 
        //default constructor UserLogin
    public UserLogin() {
    }    
        //method authenticate get username and password to checking whether the user is authenticated or not.
    public Member authenticate(String username, String password){
        Session session = hibernateUtil.HibernateUtil.openSession();
        Transaction transaction = session.beginTransaction();
        Query q=session.createQuery("from Member where Email='"+username+"' and UserPassword='"+password+"'");
        Member regis=(Member)q.uniqueResult();
        
        if(regis !=null) {           
            return regis;
        }else       
        return null;
    }   //finished method authenticate


    
}
