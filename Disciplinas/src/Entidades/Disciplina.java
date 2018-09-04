/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.util.List;

/**
 *
 * @author caio
 */
public class Disciplina {
    private String nome;
    private int codigo;
    private List<String> requisitos;
    
    public Disciplina(String nome, int codigo, List<String> requisitos){
        this.nome = nome;
        this.codigo = codigo;
        this.requisitos = requisitos;
    } 
    public Disciplina(String nome, List<String> requisitos){
        this.nome = nome;
        this.codigo = 0;
        this.requisitos = requisitos;
    } 
    public String getNome(){
        return nome;
    }
    public int getCodigo(){
        return codigo;
    }
    public List<String> getRequisitos(){
        return requisitos;
    }
}
