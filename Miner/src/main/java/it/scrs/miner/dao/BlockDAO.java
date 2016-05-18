/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.miner.dao;

import it.scrs.miner.models.Block;
import it.scrs.miner.util.DbSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

/**
 *
 * @author giordanocristini
 */
public class BlockDAO {
    private Session session;
    private static BlockDAO dao;
    
    private BlockDAO(){
        
    }
    public Block getLastBlock(){
        session=DbSession.getSession();
        session.beginTransaction();
        Block block;
      
        Criteria crit=session.createCriteria(Block.class);
        crit=(Criteria) crit.addOrder(Order.desc("level"))
                            .setMaxResults(1);
        block=(Block) crit.uniqueResult();
        session.close();
        return block;
    }
    
    public static BlockDAO getBlockDAO(){
        if(dao==null)
            dao=new BlockDAO();
        return dao;
    }
}
