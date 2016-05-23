/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.miner.gui;

import it.scrs.miner.Miner;
import it.scrs.miner.dao.BlockDAO;
import it.scrs.miner.models.Block;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
/**
 *
 * @author giordanocristini
 */
public class MinerGUI extends JFrame {
    private Miner miner;
    private JButton start;
    private Thread mining;
    private MinRunnable minR;
    public MinerGUI(Miner miner){
        super("Miner client");
        this.miner=miner;
        JPanel panel = new JPanel(new BorderLayout());
        start = new JButton("Avvia miner");
        start.addActionListener(new MinerStart());
        JButton stop = new JButton("Stop miner");
        panel.add(start, BorderLayout.PAGE_START);
        panel.add(stop, BorderLayout.PAGE_END);
        stop.addActionListener(new MinerStop());
        this.add(panel);
        this.pack();
        this.setLocationRelativeTo(null);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setVisible(true);
    }
    
    private class MinerStart implements ActionListener{

        @Override
        public void actionPerformed(ActionEvent e) {
           // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
           minR=new MinRunnable();
           mining=new Thread(minR);
           mining.start();
                       
                
           
          
           
        }
        
    }
    private class MinRunnable implements Runnable {

        
        private boolean run = true;

        public void stop() {
            run = false;
        }

        @Override
        public void run() {
                 start.setEnabled(false);
                 miner.loadNetworkConfig();
                 Block b= (BlockDAO.getBlockDAO().getLastBlock());                 
                 boolean connected = miner.firstConnectToEntryPoint();
                 System.out.println(connected);
                 while(run) {
                     System.out.println("SCRS 2016");
                 }               
        }
        
    }

        
    
    private class MinerStop implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            minR.stop();
            start.setEnabled(true);
        }
        
    }
}
