
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author caio
 */
public class Principal {
    public static void main(String[] args) {
        BufferNaoSincronizado bf = new BufferNaoSincronizado(6);
        Gravador g1 = new Gravador(bf,5);
        Gravador g2 = new Gravador(bf,8);
        
        ExecutorService e = Executors.newCachedThreadPool();
        
        e.execute(g1);
        e.execute(g2);
        e.shutdown();
        
        
        try{
            boolean termino = e.awaitTermination(1, TimeUnit.HOURS);
            System.out.println((termino?"Terminou":"Timeout"));
        }catch(InterruptedException erro){
            erro.printStackTrace();
        }
         System.out.println("fim do main");
 
        for(int i = 0; i<6; i++){
            System.out.println(bf.getBuffer(i));
        }
       
    }
}
