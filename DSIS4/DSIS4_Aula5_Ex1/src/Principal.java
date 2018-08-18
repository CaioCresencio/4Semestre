
import java.util.concurrent.Executor;
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
        Carro c1 = new Carro("C1");
        Carro c2 = new Carro("C2");
      /*  
        Thread t1 = new Thread(c1);
        Thread t2 = new Thread(c2);
        
        t1.start();
        t2.start();
        System.out.println("Fim do ");
        */
        //Utiliando um poll de threads
        ExecutorService e = Executors.newCachedThreadPool();
        //ExecutorService é filha de Executor
        e.execute(c1);
        e.execute(c2);
        e.shutdown();
        try{
            boolean termino = e.awaitTermination(1, TimeUnit.HOURS);
            System.out.println((termino?"Terminou":"Timeout"));
        }catch(InterruptedException erro){
            erro.printStackTrace();
        }
       
    }
    //thread representa um fluxo de execução no programa
    
}
