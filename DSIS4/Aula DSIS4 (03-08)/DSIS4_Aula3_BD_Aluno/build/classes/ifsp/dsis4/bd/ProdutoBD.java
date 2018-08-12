/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.bd;

import ifsp.dsis4.entidades.Produto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DênisLeonardo
 */

public class ProdutoBD {
    
    public void salvar(Produto produto) {
        String sql = "insert into Produto(idProduto,nomeProduto,dataFabProduto,estoqueProduto,precoProduto) "
                + "values(id_produto.nextval,?,?,?,?)";
        ConexaoBD conexao = ConexaoBD.getInstance();
        try (
            Connection con = conexao.getConnection();
            PreparedStatement pStat = con.prepareStatement(sql,new String[]{"idProduto"});
            
            )
        {   
            
            pStat.setString(1,produto.getNome());
            pStat.setDate(2, java.sql.Date.valueOf(produto.getDataFab()));
            pStat.setInt(3,produto.getEstoque());
            pStat.setDouble(4, produto.getPreco());
            pStat.executeUpdate();
            try(ResultSet rs = pStat.getGeneratedKeys()){
                if(rs.next()){
                    long id = rs.getLong(1);
                    produto.setId(id);
                }
            }
        }
        catch(SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
    
    public List<Produto> listarTodosPeloNome(String substring) {
        String sql = "select * from Produto where nomeProduto like ?";
        ConexaoBD conexao = ConexaoBD.getInstance();
        List<Produto> produtos = new ArrayList<>();
        try (
            Connection con = conexao.getConnection();
            PreparedStatement pStat = con.prepareStatement(sql))
        {
            pStat.setString(1, '%'+substring+'%');
            try(ResultSet rs = pStat.executeQuery()) {
                while(rs.next()) {
                    String nome = rs.getString("nomeProduto");
                    LocalDate dataFab = rs.getDate("dataFabProduto").toLocalDate();
                    int estoque = rs.getInt("estoqueProduto");
                    double preco = rs.getDouble("precoProduto");
                    produtos.add(new Produto(nome, dataFab, estoque, preco));
                }
                return produtos;
            }
        }
        catch(SQLException erro) {
            throw new RuntimeException(erro);
        }
    }
}
