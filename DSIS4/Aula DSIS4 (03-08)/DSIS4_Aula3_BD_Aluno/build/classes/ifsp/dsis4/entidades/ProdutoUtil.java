/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.entidades;

import ifsp.dsis4.bd.ProdutoBD;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author caioc
 */
public class ProdutoUtil {
    
    public Object[] toArray(Produto p){
                String nome =p.getNome();
                String data = formatarData(p.getDataFab());
                String preco = formatarPreco(p.getEstoque());
                String estoque = String.valueOf(p.getPreco());
                String tempo = formatarData(p.getDataFab());
                 Object[] linha ={nome,data,estoque,preco,tempo};
                 return linha;
    }
    private String formatarData(LocalDate data){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
        return data.format(formatter);
    }
    private String formatarPreco(double preco){
        NumberFormat formatter = NumberFormat.getCurrencyInstance();
        formatter.setMinimumFractionDigits(2);
        return formatter.format(preco);
    }
    public String getExistencia(LocalDate data){
        LocalDate atual = LocalDate.now();
        LocalDate fab =data;
        
        Period periodo = Period.between(atual, fab);
        String retorno = "";
        return  retorno;
        
    }
    
}
