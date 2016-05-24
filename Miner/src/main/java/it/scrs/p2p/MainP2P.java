/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.p2p;

import it.scrs.miner.util.OsUtils;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MainP2P extends Thread {

    int porta = 9100;

    public MainP2P(int porta) {
        this.porta = porta;
    }

    public void run() {

        try {
           
            ServerSocket portaDiAscolto = new ServerSocket(porta);
            System.out.printf("Start - porta di ascolto: %d - id: %s", porta, portaDiAscolto.getInetAddress().getHostAddress());
            
            while (true) {
                Socket connessione = portaDiAscolto.accept(); //attesa nuovo utente
                BufferedReader inClient = new BufferedReader(new InputStreamReader(connessione.getInputStream()));
                DataOutputStream outClient = new DataOutputStream(connessione.getOutputStream());
                String comando = inClient.readLine();
                if (comando.equals("dump")) {
                    if (OsUtils.isWindows()) {
                        String[] pp = new String[]{"cmd.exe", "/c", "mysqldump --host=localhost --user root --password=a30l10e90 --opt campusx > dump.sql"};
                        Runtime.getRuntime().exec(pp);
                    } else {
                        String[] pp = new String[]{"sh", "-c", "mysqldump --host=localhost --user root --password=a30l10e90 --opt campusx > dump.sql"};
                        Runtime.getRuntime().exec(pp);
                    }
                    File myFile = new File("C:\\Users\\Alessandro\\Documents\\NetBeansProjects\\SCRS\\Miner\\dump.sql");
                    byte[] mybytearray = new byte[(int) myFile.length()];
                    FileInputStream fis = new FileInputStream(myFile);
                    BufferedInputStream bis = new BufferedInputStream(fis);
                    bis.read(mybytearray, 0, mybytearray.length);
                    outClient.write(mybytearray, 0, mybytearray.length);
                    outClient.flush();
                    System.out.println("Done.");
                }

            }
        } catch (IOException ex) {
            Logger.getLogger(MainP2P.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
