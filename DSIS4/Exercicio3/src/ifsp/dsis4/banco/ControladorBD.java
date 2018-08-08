/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.banco;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author caio 
*/
public class ControladorBD {
    public String[] getTabela(){
        String sql = "select * from employees";
        ConexaoBD con = ConexaoBD.getInstance();
        String[] retorno = null; 
        
        try( Connection conexao = con.getConnection();
             PreparedStatement pStat = conexao.prepareStatement(sql) )
        {
           
           try(ResultSet rs = pStat.executeQuery() )
           {
               
                ResultSetMetaData rsmd  = rs.getMetaData();
                int colunas = rsmd.getColumnCount();
                
                retorno = new String[colunas];
                for(int i = 1; i<=colunas;i++){
                    retorno[i-1] = rsmd.getColumnName(i);
                }
              
           }
        }catch(SQLException e){
            System.out.println("Erro: "+e.getMessage());
        }
        return retorno;
    }
    
    public List<String[]> getDados(){
        String sql = "select * from employees";
        ConexaoBD con = ConexaoBD.getInstance();
        
        List<String[]> lista = new LinkedList<>();
        try(Connection conexao = con.getConnection();
             PreparedStatement pStat = conexao.prepareStatement(sql))
            
                     
        {
            try(ResultSet rs = pStat.executeQuery())
            {
                ResultSetMetaData rsmd  = rs.getMetaData();
                int colunas = rsmd.getColumnCount();
                //String[] vetor = new String[colunas];
                while(rs.next()){
                    String[] vetor = new String[colunas];
                    for(int i=1; i <= rsmd.getColumnCount(); i++ ){
                        vetor[i-1] = rs.getString(i);
                    }
                    lista.add(vetor);
                }
            }
        }catch(SQLException e){
            System.out.println("Erro: "+e.getMessage());
        }
            
        return lista;
        
    }
}
