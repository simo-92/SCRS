package it.scrs.miner.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import it.scrs.miner.models.Pairs;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

/**classe di utilita per effettuare richieste http verso il sistema legacy */
public class HttpUtil {
    
    /**
     * esegue una richiesta get
     * @param url url a cui inviare la richiesta
     * @return risposta ricevuta
     * @throws possibili errori di comunicazione HTTP
     */
    public static String doGet(String url) throws Exception{
       
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet request = new HttpGet(url);
        HttpResponse response;
        response = client.execute(request);
        BufferedReader rd;
        rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
        StringBuffer result = new StringBuffer();
        String line = "";
        while((line = rd.readLine()) != null){
            result.append(line);
        }
        return result.toString();
    }
    
    /**
     * esegue una richiesta post
     * @param url url a cui inviare la richiesta
     * @return risposta ricevuta
     * @throws possibili errori di comunicazione HTTP
     */
    public static String doPost(String url,Pairs... parameters)throws Exception{
        
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(url);
        List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
        for(Pairs p:parameters){
            urlParameters.add(new BasicNameValuePair(p.getValue1(),p.getValue2()));
        }
        post.setEntity(new UrlEncodedFormEntity(urlParameters));
        HttpResponse response = client.execute(post);
        BufferedReader rd;
        rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
        StringBuffer result = new StringBuffer();
        String line = "";
        while((line = rd.readLine()) != null){
            result.append(line);
        }
        return result.toString();
    }
    
}
