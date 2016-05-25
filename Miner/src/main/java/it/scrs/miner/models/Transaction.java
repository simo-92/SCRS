/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.miner.models;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="transaction")
public class Transaction {
    @Id
    @Column(name="hashFile")
    private String hashFile;
    @Column(name="filename")
    private String filename;
    @ManyToOne
    @JoinColumn(name="author")
    private User author;
   // private final int k= 50;
//    @ManyToOne
//    @JoinColumn(name="blockId")
    //private Block blockContainer; //è il blocco che contiene la transazione
    @OneToOne
    @JoinColumn(name="hashNextTransaction")
    private Transaction nextTransaction;
    
    @ManyToMany
    @JoinTable(name="citation",joinColumns={
        @JoinColumn(name="citing")}, inverseJoinColumns={
        @JoinColumn(name="cited")
    })
    private List<Transaction> citations;
  //  private boolean continues; // true se è il primo blocco altrimenti continua le citazioni di un altra transazione
    
    public Transaction(){}
    

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

//    public int getK() {
//        return k;
//    }

    public List<Transaction> getCitations() {
        return citations;
    }

    public void setCitations(List<Transaction> citations) {
        this.citations=citations;
    }

//    public boolean isContinues() {
//        return continues;
//    }
//
//    public void setContinues(boolean continues) {
//        this.continues = continues;
//    }

    /**
     * @return the blockContainer
     */
//    public Block getBlockContainer() {
//        return blockContainer;
//    }
//
//    /**
//     * @param blockContainer the blockContainer to set
//     */
//    public void setBlockContainer(Block blockContainer) {
//        this.blockContainer = blockContainer;
//    }

    /**
     * @return the nextTransaction
     */
    public Transaction getNextTransaction() {
        return nextTransaction;
    }

    /**
     * @param nextTransaction the nextTransaction to set
     */
    public void setNextTransaction(Transaction nextTransaction) {
        this.nextTransaction = nextTransaction;
    }

  
      
      
}
