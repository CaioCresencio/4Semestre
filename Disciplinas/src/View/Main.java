/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import Banco.ConexaoBD;
import Banco.ControleBD;
import Entidades.Disciplina;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author caio
 */
public class Main {
    public static void main(String[] args) {
        ConexaoBD conexaoBD = ConexaoBD.getInstance();
        try{
            conexaoBD.getConnection();
            System.out.println("Conectado com o banco...\n");
        }catch(SQLException e){
            System.out.println("Erro ao conectar com o banco\n");
        }
        List<String> req = new ArrayList<>();
        req.add("POOS3");
        req.add("AOOS3");
        req.add("BD1S3");
        ControleBD controle = new ControleBD();
        Disciplina disc = new Disciplina("DSIS4",req);
        controle.insereDisciplina(disc);
        
    }
}
