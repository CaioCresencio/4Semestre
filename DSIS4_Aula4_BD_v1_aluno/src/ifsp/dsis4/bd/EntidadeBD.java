/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.bd;

import ifsp.dsis4.entidades.ListaEntidade;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

/**
 *
 * @author denis
 */
public class EntidadeBD {
    
    public ListaEntidade buscarEntidades(String nomeTabela) {
        String sql = "";
        if(checaTabela(nomeTabela.toUpperCase())){
          sql = String.format("select * from %s",nomeTabela);
        }
        ConexaoBD conexao = ConexaoBD.getInstance();
        ListaEntidade lista = null;
        try (
            Connection con = conexao.getConnection();
            PreparedStatement pStat = con.prepareStatement(sql);
            ResultSet rs = pStat.executeQuery()) 
        {
            ResultSetMetaData rsmd = rs.getMetaData();
            String[] colunas = getColunas(rsmd);
            lista = new ListaEntidade(colunas);
            while(rs.next()){
                Object[] linha = new Object[colunas.length];
                for(int i = 0; i<colunas.length; i++){
                    linha[i] = rs.getObject(i+1);
                }
                lista.addLinha(linha);
            }
        }
        catch(SQLException erro) {
            throw new RuntimeException(erro);
        }
        return lista;
    } 
    public boolean checaTabela(String nomeTabela){
        ConexaoBD conexao = ConexaoBD.getInstance();
        boolean deuCerto = false;
        try(
        Connection con = conexao.getConnection())
        {
            DatabaseMetaData dmd = con.getMetaData();
            try( ResultSet rs = dmd.getTables(null, null, nomeTabela, new String[]{"TABLE"})){
                if(rs.next()){
                    deuCerto = true;
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return deuCerto;
    }
    private String[] getColunas(ResultSetMetaData rsmd) throws SQLException{
        int qtdColunas = rsmd.getColumnCount();
        String[] colunas = new String[qtdColunas];
        for(int i=0; i<qtdColunas; i++){
            colunas[i] = rsmd.getColumnName(i+1);
        }
        return colunas;
    }
        
    //Para testes
    public void salvarEntidades() {
        String sql = "insert into Entidade (codigo, titulo) values(?,?)";
        ConexaoBD conexao = ConexaoBD.getInstance();
        try (
            Connection con = conexao.getConnection();
            PreparedStatement pStat = con.prepareStatement(sql)) 
        {
            for(int i = 0; i < 200; i++) {
                pStat.setObject(1, i+1);
                pStat.setObject(2, "titulo "+(i+1));
                pStat.executeUpdate();
            }
        }
        catch(SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
    
}
