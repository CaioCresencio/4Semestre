/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author caio
 */
public class Gravador implements Runnable {
    
    private int valorInicial;
    
    private BufferNaoSincronizado buffer;
    
    public Gravador(BufferNaoSincronizado buffer,int valorInicial){
        this.buffer = buffer;
        this.valorInicial = valorInicial;
    }

 
    @Override
    public void run() {
        for(int i = valorInicial; i < valorInicial+3; i++){
            buffer.add(i);
        }
        
    }
    
}
