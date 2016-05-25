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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;



/**
 *
 * @author alebus
 */

@Entity
@Table(name="block")
public class Block {
    @Id
    @Column(name="hashBlock")
    private String hashBlock;    //Costituisce l'id del blocco, per essere identificato in maniera UNIVOCA nella blockchain
    @Column(name="timestamp")
    private String timestamp;
  
    //private List<Transaction> transactions;
    @Column(name="merkleRoot")
    private String merkleRoot;
    @ManyToOne
    @JoinColumn(name="hashPreviousBlock")
    private Block previuosBlock;
//    @Column(name="hashPreviousBlock")
//    private String hashPreviousBlock;
    @OneToOne
    @JoinColumn(name="transactionContained")
    private Transaction transactionContained;
    
    @Column(name="minerPublickey")
    private String minerPublicKey;
    @Column(name="nonce")
    private String nonce;
    @Column(name="level")
    private int level;
    
    public Block(){
        
    }
    
    public Block(String hashBlock,String timestamp,String mr,String hpb,String mpk,String nonce,List<Transaction> tr){
        this.hashBlock=hashBlock;
        this.timestamp=timestamp;
        //this.transactions=tr;
        this.merkleRoot=mr;
        //this.hashPreviousBlock=hpb;
        this.minerPublicKey=mpk;
        this.nonce=nonce;
    }

    public String getHashBlock() {
        return hashBlock;
    }

    public void setHashBlock(String hashBlock) {
        this.hashBlock = hashBlock;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
/*
    public List<Transaction> getTransactions() {
        return transactions;
    }

    public void setTransactions(List<Transaction> transactions) {
        this.transactions = transactions;
    }
*/
    public String getMerkleRoot() {
        return merkleRoot;
    }

    public void setMerkleRoot(String merkleRoot) {
        this.merkleRoot = merkleRoot;
    }

//    public String getHashPreviousBlock() {
//        return hashPreviousBlock;
//    }
//
//    public void setHashPreviousBlock(String hashPreviousBlock) {
//        this.hashPreviousBlock = hashPreviousBlock;
//    }

    public String getMinerPublicKey() {
        return minerPublicKey;
    }

    public void setMinerPublicKey(String minerPublicKey) {
        this.minerPublicKey = minerPublicKey;
    }

    public String getNonce() {
        return nonce;
    }

    public void setNonce(String nonce) {
        this.nonce = nonce;
    }

    /**
     * @return the previuosBlock
     */
    public Block getPreviuosBlock() {
        return previuosBlock;
    }

    /**
     * @param previuosBlock the previuosBlock to set
     */
    public void setPreviuosBlock(Block previuosBlock) {
        this.previuosBlock = previuosBlock;
    }

  
    
    
}
