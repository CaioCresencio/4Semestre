/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.principal;

import ifsp.dsis4.bd.ConexaoBD;
import ifsp.dsis4.bd.ProdutoBD;
import ifsp.dsis4.entidades.Produto;
import ifsp.dsis4.visoes.JanelaPrincipal;
import java.sql.Connection;
import java.time.LocalDate;

/**
 *
 * @author DênisLeonardo
 */
public class Principal {
    
    public static void main(String args[]) {
        try {
            ConexaoBD conexao = ConexaoBD.getInstance();
            Connection con = conexao.getConnection();
            /*ProdutoBD pBD = new ProdutoBD();
            LocalDate ld = LocalDate.now();
            for(int i=1;i<=200;i++){
                pBD.salvar(new Produto("teste",ld,1,2));
            }*/
            System.out.println("Conexão realizada com sucesso");
            JanelaPrincipal janela = new JanelaPrincipal();
        }
        catch(Exception erro) {
            System.out.println("Erro. Aplicação encerrada");
        }
    }
}
