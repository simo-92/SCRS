/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

public class Transaction {
      
    private String hashFile;
    private String filename;
    private User author;
    private final int k= 50;
    private String[] citations = new String[k];
    private boolean continues; // true se è il primo blocco altrimenti continua le citazioni di un altra transazione
    
    
    public Transaction(String hashFile,String filename, User author,String[] citations,boolean b){
        this.hashFile = hashFile;
        this.filename = filename;
        this.author = author;
        this.citations = citations;
        this.continues=b;
    }

    public String getHashFile() {
        return hashFile;
    }

    public void setHashFile(String hashFile) {
        this.hashFile = hashFile;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public int getK() {
        return k;
    }

    public String[] getCitations() {
        return citations;
    }

    public void setCitations(String[] citations) {
        this.citations = citations;
    }

    public boolean isContinues() {
        return continues;
    }

    public void setContinues(boolean continues) {
        this.continues = continues;
    }
      
      
}
