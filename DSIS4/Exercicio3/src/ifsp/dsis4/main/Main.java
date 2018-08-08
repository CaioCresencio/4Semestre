/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.main;

import ifsp.dsis4.banco.ConexaoBD;
import ifsp.dsis4.banco.ControladorBD;
import ifsp.dsis4.front.JanelaPrincipal;

/**
 *
 * @author caio
 */
public class Main {
    public static void main(String[] args) {
        ConexaoBD conexao = ConexaoBD.getInstance();
        try{
            conexao.getConnection();
            System.out.println("Conexão estabelecida!"); 
        }catch(Exception e){
            System.out.println("Algo deu errado: "+e.getMessage());
        }
        ControladorBD con = new ControladorBD();
        
        JanelaPrincipal jp = new JanelaPrincipal();
    }
}
