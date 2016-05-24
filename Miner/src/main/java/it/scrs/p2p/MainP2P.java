/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.scrs.p2p;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class MainP2P
{
	public static void main(String[] args) throws IOException 
	{
		
		int porta = 9100;
		
		
	
		ServerSocket portaDiAscolto = new ServerSocket( porta );
		System.out.printf("Start - porta di ascolto: %d - id: %s", porta , portaDiAscolto.getInetAddress().getHostAddress() );
		
		while(true)
		{
		    Socket connessione = portaDiAscolto.accept(); //attesa nuovo utente
                    BufferedReader inClient = new BufferedReader(new InputStreamReader(connessione.getInputStream()));
                    DataOutputStream outClient = new DataOutputStream(connessione.getOutputStream());
                    String comando = inClient.readLine();
                    if(comando.equals("dump")){
                        outClient.writeBytes("E mo so cazzi\n");
                    }
			
		}
	}
}
