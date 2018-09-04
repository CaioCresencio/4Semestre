/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Banco;

import Entidades.Disciplina;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


/**
 *
 * @author caio
 */
public class ControleBD {
    public void insereDisciplina(Disciplina disciplina){
        //String sql = String.format("insert into disciplina (nome_disc,codigo_disc) values ('%s',%d)",disciplina.getNome(),disciplina.getCodigo());
        String sql  = "insert into disciplina (nome_disc,codigo_disc) values (?,seq_disciplina.nextval)";
        ConexaoBD conexaoBD = ConexaoBD.getInstance();
        try(Connection con = conexaoBD.getConnection())
        {
            con.setAutoCommit(false);
            normalizaRequisitos(con,disciplina);
            try(PreparedStatement pStat = con.prepareStatement(sql))
            {    
                pStat.setString(1, disciplina.getNome());
                pStat.executeUpdate();
                registraRequisitos(con,disciplina);
               
                con.commit();
            }catch(SQLException erro){
                con.rollback();
                System.out.println("Ocorreu um erro ao inserir uma nova Disciplina: "+erro.getMessage());
            }       
        }catch(SQLException e){
            System.out.println("Ocorreu um erro ao inserir uma nova Disciplina: "+e.getMessage());
        }
        
    }
    private void registraRequisitos(Connection con, Disciplina disciplina){
        List<String> requisitos = disciplina.getRequisitos();
            for(String req : requisitos){
                if(!confereRequisitos(disciplina.getNome(),req,con)){
                    String sql = "insert into requisitos (nome_disc,requisito) values (?,?) ";
                    try(PreparedStatement pStat = con.prepareStatement(sql))
                    {
                        pStat.setString(1, disciplina.getNome());
                        pStat.setString(2, req);
                        pStat.executeUpdate();
                    }catch(SQLException erro){
                        System.out.println("erro na criação dos requisitos: "+erro.getMessage());
                    }
                }
         }
    }
    private void normalizaRequisitos(Connection con, Disciplina disciplina){
        List<String> requisitos = disciplina.getRequisitos();
        for(String req : requisitos){
            
            String nome = disciplina.getNome();
            if(!confereDisciplina(nome,con)){
               
                String sql = String.format("insert into disciplina (nome_disc,codigo_disc) values('%s',seq_disciplina.nextval)",req);
                try(PreparedStatement pStat = con.prepareStatement(sql))
                {
                    pStat.executeUpdate();
                }catch(SQLException e){
                    System.out.println("Ocorreu um problema ao inserir um novo requisito: "+e.getMessage());
                }
            }
            
        }  
    }
    private boolean confereDisciplina(String disciplina,Connection con){
        boolean existe = false;
        String sql = String.format("select * from disciplina where nome_disc like '%s'",disciplina);
        try(PreparedStatement pStat = con.prepareStatement(sql))
        {
         
            ResultSet rs = pStat.executeQuery();
            if(rs.next()){
                existe = true;
            }
        }catch(SQLException e){
            System.out.println("Erro na busca: "+e.getMessage());
        }
      
        return existe;
    }
    private boolean confereRequisitos(String disciplina, String requisito, Connection con){
        boolean existe = false;
        String sql = String.format("select * from requisitos where nome_disc like '%s' and requisito like '%s' ",disciplina,requisito);
        try(PreparedStatement pStat = con.prepareStatement(sql))
        {
         
            ResultSet rs = pStat.executeQuery();
            if(rs.next()){
                existe = true;
            }
        }catch(SQLException e){
            System.out.println("Erro na busca: "+e.getMessage());
        }
       
        return existe;
    }

}

