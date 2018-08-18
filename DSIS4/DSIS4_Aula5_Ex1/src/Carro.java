/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author caio
 */
public class Carro implements Runnable{
    
    private String marca;
    
    public Carro(String marca){
        this.marca = marca;
    }
    
    @Override
    public void run() {
        System.out.println("Marca: "+marca+" correndo");
        try{
            Thread.sleep(1000) ;
        }catch(InterruptedException erro){
            Thread.currentThread().interrupt();
            //reinterrompemos a thread, qualquer outro metodo podera saber que thread corrente foi interrompida
            throw new RuntimeException(erro);
            
        }
        System.out.println("Marca: "+marca+" finalizando");
    }
    
}
