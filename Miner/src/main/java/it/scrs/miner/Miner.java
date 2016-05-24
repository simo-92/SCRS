/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.miner;

import com.google.gson.reflect.TypeToken;
import it.scrs.miner.dao.BlockDAO;
import it.scrs.miner.gui.MinerGUI;
import it.scrs.miner.models.Block;
import it.scrs.miner.util.HttpUtil;
import it.scrs.miner.util.JsonUtility;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import it.scrs.miner.models.Pairs;
import it.scrs.miner.models.Transaction;
import it.scrs.miner.util.DbSession;
import it.scrs.p2p.MainP2P;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.Collection;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import javax.swing.SwingUtilities;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class Miner {
    
    private String ipEntryPoint;
    private String portEntryPoint;
    private String entryPointBaseUri;
    private List<String> ipPeers; // contiene gli ip degli altri miner nella rete
    private MinerGUI gui;
    private Block lastBlock;
    private List<Transaction> transactionsList;
    
    public static void main(String args[]) throws IOException{
        //TODO avviare gui

        Miner miner = new Miner();
        MainP2P prova = new MainP2P(9100);
        prova.run();
        //miner.loadBlockChain();
        //MinerGUI gui = new MinerGUI(miner);            

        //miner.loadNetworkConfig();
       // miner.firstConnectToEntryPoint();
       
      
//                            
//
//        Block block = (Block) crit.uniqueResult();
//        System.out.println(block.getHashBlock());
//        Block nested=block.getPreviuosBlock();
//        System.out.println(nested.getHashBlock());
//        Block pre=nested.getPreviuosBlock();
//        System.out.println(pre.getHashBlock());
//        Block prepre=pre.getPreviuosBlock();
//        System.out.println(prepre.getHashBlock());
       // System.out.println(BlockDAO.getBlockDAO().getLastBlock().getHashBlock());
//        Transaction trans;
//        trans=(Transaction) session.createCriteria(Transaction.class).add(Restrictions.eq("hashFile","hfile1")).uniqueResult();
//        
//        session.getTransaction().commit();
//        //Transaction trans;
//       // trans=(Transaction) se.getCurrentSession().createCriteria(Transaction.class).add(Restrictions.eq("hashFile","hfile1")).uniqueResult();
//        
//        session.close();
       // DbSession.destroyService();
    }
    
    public void loadBlockChain() throws IOException {
        Block lastGivenBlock = null;
        //int index = new Random().nextInt(ipPeers.size());
            String ip = "160.80.216.205";
            String result = "";
            Socket conn=new Socket(ip,9100);
            BufferedReader res = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            DataOutputStream outStream = new DataOutputStream(conn.getOutputStream());
            
            try {
                //result = HttpUtil.doPost(url,new Pairs("comand","getAllBlockChain"), new Pairs("last", "uuu"));
                outStream.writeBytes("dump\n");
                while((result = res.readLine())!=null){
                    System.out.println(result);
                }
                
//                Type type;
//                type = new TypeToken<Block>() {
//                }.getType();
//                lastGivenBlock = ((Block) JsonUtility.fromJson(result, type));
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        //TODO Provare a scaricare da un secondo Peer e vedere se c'e' qualcosa di nuovo
//        if(lastGivenBlock != null){
//            lastBlock = lastGivenBlock;
//        }
//        url = "http://" + ipPeers.get(index) + ":" + 9100 + "/getAllTransactions";
//        result = "";
//        try {
//                result = HttpUtil.doGet(url);
//                Type type;
//                type = new TypeToken<Block>() {
//                }.getType();
//                lastGivenBlock = ((Block) JsonUtility.fromJson(result, type));
//            } catch (Exception ex) {
//                ex.printStackTrace();
//            }
        
    }
    
    
    public void loadNetworkConfig(){
        Properties prop = new Properties();
        InputStream in = Miner.class.getResourceAsStream("/conf/network.properties");
        try{
            prop.load(in);
        }catch(IOException e){
            e.printStackTrace();
        }
        this.setIpEntryPoint(prop.getProperty("ipEntryPoint"));
        this.setPortEntryPoint(prop.getProperty("portEntryPoint"));
        this.setEntryPointBaseUri(prop.getProperty("entryPointBaseUri"));
    }
    
    public boolean firstConnectToEntryPoint(){  
        String url = "http://"+this.getIpEntryPoint()+":"+this.getPortEntryPoint()+this.getEntryPointBaseUri();
        String result="";
        String localIp="";
        try {  
            localIp=InetAddress.getLocalHost().getHostAddress();
            result = HttpUtil.doPost(url,new Pairs("ip",localIp));
        } catch (Exception ex) {
             ex.printStackTrace();
             return false;
        }
        Type type;
        type = new TypeToken<ArrayList<String>>(){}.getType();
        this.ipPeers = (List<String>) JsonUtility.fromJson(result,type);
        return true;
    }

    
    
    public String getIpEntryPoint() {
        return ipEntryPoint;
    }

    public void setIpEntryPoint(String ipEntryPoint) {
        this.ipEntryPoint = ipEntryPoint;
    }

    public String getPortEntryPoint() {
        return portEntryPoint;
    }

    public void setPortEntryPoint(String portEntryPoint) {
        this.portEntryPoint = portEntryPoint;
    }

    public String getEntryPointBaseUri() {
        return entryPointBaseUri;
    }

    public void setEntryPointBaseUri(String entryPointBaseUri) {
        this.entryPointBaseUri = entryPointBaseUri;
    }
    
    
    
}
