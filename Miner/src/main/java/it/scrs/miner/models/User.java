/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.miner.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author alebus
 */
@Entity
@Table(name="user")
public class User {
    @Id
    @Column(name="publicKeyHash")
    private String publicKeyHash;
    @Column(name="publicKey")
    private String publicKey;
    //private String privatekey;
    @Column(name="name")
    private String name;
    @Column(name="lastname")
    private String lastName;
    @Column(name="email")
    private String email;
    @Column(name="username")
    private String username;
    
    
    public User(){}
    public User(String puK, String prK, String name, String lname, String email, String usr ){
        this.publicKey =puK;
        //this.privatekey = prK;
        this.name=name;
        this.lastName=lname;
        this.email=email;
        this.username=usr;
    }
    
    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

//    public String getPrivatekey() {
//        return privatekey;
//    }
//
//    public void setPrivatekey(String privatekey) {
//        this.privatekey = privatekey;
//    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
}
