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
import java.util.ArrayList;
import java.util.List;

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
    
    public ListaEntidade buscarIntervalo(String nomeTabela,int max,int min) {
        String sql = "";
        if(checaTabela(nomeTabela.toUpperCase())){
          sql = String.format("select * from ((select e.*,rownum rn from (select * from %s order by %s) e where rownum <= %d ) ) where rn >= %d",nomeTabela,getPK(nomeTabela),max,min);
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
    public String getPK(String nomeTabela){
        ConexaoBD conexao = ConexaoBD.getInstance();
        String retorno = null;
        try(
        Connection con = conexao.getConnection())
        {
            DatabaseMetaData dmd = con.getMetaData();
            try( ResultSet rs = dmd.getPrimaryKeys(null, null, nomeTabela)){
                if(rs.next()){
                    retorno = rs.getString("COLUMN_NAME");
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return retorno;
        
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
    public List<String> listaTabelas(){
        ConexaoBD conexao = ConexaoBD.getInstance();
        List<String> lista = new ArrayList();
        try(
        Connection con = conexao.getConnection())
        {
            DatabaseMetaData dmd = con.getMetaData();
            try( ResultSet rs = dmd.getTables(null,"HR",null, new String[]{"TABLE"})){
                while(rs.next()){
                    lista.add(rs.getString(3));
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return lista;
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
