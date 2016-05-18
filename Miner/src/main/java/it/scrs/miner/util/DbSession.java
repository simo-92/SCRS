/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.miner.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

/**
 *
 * @author giordanocristini
 */
public class DbSession {
    private static final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
    private static final SessionFactory se = new MetadataSources(registry).buildMetadata().buildSessionFactory();
    
    private DbSession(){
        
    }   
    
    public static Session getSession(){
        return se.openSession();
    }
    
    public static void destroyService(){
        StandardServiceRegistryBuilder.destroy(se.getSessionFactoryOptions().getServiceRegistry());
    }
}
