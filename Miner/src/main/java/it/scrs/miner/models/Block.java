/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.miner.models;

import java.util.List;



/**
 *
 * @author alebus
 */
public class Block {
    
    private String id;
    private String timestamp;
    private List<Transaction> transactions;
    private String merkleRoot;
    private String hashPreviousBlock;
    private String minerPublicKey;
    private int nonce;
    private String proofOfWork;
    
    public Block(String id,String timestamp,String mr,String hpb,String mpk,int nonce,String pow,List<Transaction> tr){
        this.id=id;
        this.timestamp=timestamp;
        this.transactions=tr;
        this.merkleRoot=mr;
        this.hashPreviousBlock=hpb;
        this.minerPublicKey=mpk;
        this.nonce=nonce;
        this.proofOfWork=pow;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public List<Transaction> getTransactions() {
        return transactions;
    }

    public void setTransactions(List<Transaction> transactions) {
        this.transactions = transactions;
    }

    public String getMerkleRoot() {
        return merkleRoot;
    }

    public void setMerkleRoot(String merkleRoot) {
        this.merkleRoot = merkleRoot;
    }

    public String getHashPreviousBlock() {
        return hashPreviousBlock;
    }

    public void setHashPreviousBlock(String hashPreviousBlock) {
        this.hashPreviousBlock = hashPreviousBlock;
    }

    public String getMinerPublicKey() {
        return minerPublicKey;
    }

    public void setMinerPublicKey(String minerPublicKey) {
        this.minerPublicKey = minerPublicKey;
    }

    public int getNonce() {
        return nonce;
    }

    public void setNonce(int nonce) {
        this.nonce = nonce;
    }

    public String getProofOfWork() {
        return proofOfWork;
    }

    public void setProofOfWork(String proofOfWork) {
        this.proofOfWork = proofOfWork;
    }
    
    
}
