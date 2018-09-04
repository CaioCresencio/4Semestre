/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.visoes;

import ifsp.dsis4.entidades.ListaEntidade;

/**
 *
 * @author caio
 */
public class ControlePag {
    private int inicio;
    private int fim;
    private ListaEntidade lista;
    
    public ControlePag(ListaEntidade lista){
        inicio = +1;
        fim = 10;
        this.lista = lista;
    }
    
    public ListaEntidade getProx(){
        ListaEntidade retorno = null;
        System.out.println("teste2");
        if(fim+10 < 100){
            System.out.println("teste");
            retorno = new ListaEntidade();
            inicio+=10;
            fim+=10;
            for(int i =inicio; i< fim;i++){
                retorno.addLinha(lista.toAarray2d()[i]);
            }
        }
        return retorno;
    }
}
