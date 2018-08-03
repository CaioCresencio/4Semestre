/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.entidades;

import java.time.LocalDate;

/**
 *
 * @author denis
 */
public class Produto {
    private long id;
    private String nome;
    private LocalDate dataFab;
    private int estoque;
    private double preco;
    
    public Produto(long id, String nome, LocalDate dataFab, int estoque, double preco) {
        this.id = id;
        this.nome = nome;
        this.dataFab = dataFab;
        this.estoque = estoque;
        this.preco = preco;
    }
    
    public Produto(String nome, LocalDate dataFab, int estoque, double preco) {
        this(0, nome, dataFab, estoque, preco);
    }  

    public long getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public LocalDate getDataFab() {
        return dataFab;
    }

    public int getEstoque() {
        return estoque;
    }

    public double getPreco() {
        return preco;
    }
    
    public void setId(long id) {
        this.id = id;
    }
}
