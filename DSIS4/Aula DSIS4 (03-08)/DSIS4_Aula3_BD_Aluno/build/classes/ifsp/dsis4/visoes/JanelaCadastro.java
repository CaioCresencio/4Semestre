/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.visoes;

import com.toedter.calendar.JDateChooser;
import ifsp.dsis4.bd.ProdutoBD;
import ifsp.dsis4.entidades.Produto;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author denis
 */
public class JanelaCadastro extends JInternalFrame {
    
    private JPanel panel;
    private JLabel labelId;
    private JLabel labelNome;
    private JLabel labelDataFab;
    private JLabel labelEstoque;
    private JLabel labelPreco;
    
    private JTextField fieldId; //field não editável
    private JTextField fieldNome;
    //componente para inserção da data
    private JTextField fieldEstoque;
    private JTextField fieldPreco;
    private JDateChooser chooserData;
    
    private JButton buttonInserir;
    private JButton buttonFechar;

    public JanelaCadastro() {
        super("Janela de Cadastro",true,true,true,true);
        criarComponentes();
        configurarJanela();
    }
    
    private void criarComponentes() {
        panel = new JPanel();
        panel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Inserção de produtos"));
        
        //labels
        labelId = new JLabel("ID:");
        labelNome = new JLabel("Nome:");
        labelDataFab = new JLabel("Data de fabricação:");
        labelEstoque = new JLabel("Estoque:");
        labelPreco = new JLabel("Preço:");
        
        //fields e JDateChooser
        fieldId = new JTextField(2);
        fieldId.setEditable(false);
        fieldNome = new JTextField(10);
        chooserData = new JDateChooser();
        chooserData.setPreferredSize(new Dimension(100,30));
        //componente para inserção da data
        fieldEstoque = new JTextField(3);
        fieldPreco = new JTextField(5);
        
        //buttons
        buttonInserir = new JButton("Inserir");
        buttonInserir.addActionListener(this::inserir);
        buttonFechar = new JButton("Fechar");
        buttonFechar.addActionListener(this::fechar);
        
        panel.add(labelId);
        panel.add(fieldId);
        panel.add(labelNome);
        panel.add(fieldNome);
        panel.add(chooserData);
        //adicionar os componentes referentes à data
        panel.add(labelEstoque);
        panel.add(fieldEstoque);
        panel.add(labelPreco);
        panel.add(fieldPreco);
        panel.add(buttonInserir);
        panel.add(buttonFechar);
        add(panel);
    }
    
    private void configurarJanela() {
        setVisible(true);
        //setSize(600,200);
        pack();
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
    }
    
    private void inserir(ActionEvent e) {
        String nome = fieldNome.getText();
        Date temp = chooserData.getDate();
        Instant instant = temp.toInstant();
        ZonedDateTime dt = instant.atZone(ZoneId.systemDefault());
        LocalDate dataFab = dt.toLocalDate();
        int estoque = Integer.parseInt(fieldEstoque.getText());
        double preco = Double.parseDouble(fieldPreco.getText());
        Produto produto = new Produto(nome,dataFab,estoque,preco);
        ProdutoBD produtoBD  = new ProdutoBD();
        try{
            produtoBD.salvar(produto);
            fieldId.setText(String.valueOf(produto.getId()));
        }catch(Exception erro){
            System.out.println("Ocorreu um erro "+erro.getMessage());
        }
            
    }
    
    private void fechar(ActionEvent e) {
        dispose();
    }
}
