/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.entidades;

import java.util.ArrayList;
import java.util.List;



/**
 *
 * @author denis
 */
//Representa uma tabela do BD
public class ListaEntidade {
    
    private String[] colunas;
    private List<Object[]> linhas;
    
    public ListaEntidade(String[] colunas){
        this.colunas = colunas;
        linhas = new ArrayList<>();
    }
    
    public boolean addLinha(Object[] linha){
        return linhas.add(linha);
    }
    public String[] getCOlunas(){
        return colunas;
    }
    public Object[][] toAarray2d(){
        Object[][] matriz = new Object[linhas.size()][colunas.length];
        for(int i=0; i <linhas.size();i++){
            System.arraycopy(linhas.get(i), 0, matriz[i], 0, colunas.length);
        }
        return matriz;
    }
}
