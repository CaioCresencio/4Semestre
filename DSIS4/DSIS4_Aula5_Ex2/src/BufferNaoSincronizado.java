/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author caio
 */
public class BufferNaoSincronizado {
    private int []array;
    private int pos;
    
    public BufferNaoSincronizado(int tam){
        array = new int[tam];
    }
    public void add(int valor){
        synchronized(this){
            if(pos < array.length){
                array[pos] = valor;
                pos++;

            }
        }
    }
    public static void x(){
        synchronized(BufferNaoSincronizado.class){}
    }
    public int getBuffer(int pos){
       int retorno =  0;
       if(pos< array.length){
           retorno = array[pos];
       }
       return retorno;
    }
}
