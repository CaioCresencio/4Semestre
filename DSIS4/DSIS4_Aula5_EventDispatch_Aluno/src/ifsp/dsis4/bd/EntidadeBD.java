/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author denis
 */
public class EntidadeBD {
        
    //Para testes
    public void salvarEntidades() {
        String sql = "insert into Entidade (codigo, titulo) values(?,?)";
        ConexaoBD conexao = ConexaoBD.getInstance();
        try (
            Connection con = conexao.getConnection();
            PreparedStatement pStat = con.prepareStatement(sql)) 
        {
            for(int i = 0; i < 100000; i++) {
                pStat.setObject(1, i+1);
                pStat.setObject(2, "titulo "+(i+1));
                pStat.executeUpdate();
            }
        }
        catch(SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
        public void salvarEntidade(int codigo, String titulo) {
        String sql = "insert into Entidade (codigo, titulo) values(?,?)";
        ConexaoBD conexao = ConexaoBD.getInstance();
        try (
            Connection con = conexao.getConnection();
            PreparedStatement pStat = con.prepareStatement(sql)) 
            
        {
            pStat.setInt(1,codigo);
            pStat.setString(2, titulo);
            pStat.executeUpdate();
           
        }
        catch(SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
    
    public int calcularTotal() {
        String sql = "select count(*) from Entidade";
        ConexaoBD conexao = ConexaoBD.getInstance();
        try (
            Connection con = conexao.getConnection();
            PreparedStatement pStat = con.prepareStatement(sql);
            ResultSet rs = pStat.executeQuery()) 
        {
            rs.next();
            return rs.getInt(1);
        }
        catch(SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
    
}
