/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.visoes;

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
        //componente para inserção da data
        fieldEstoque = new JTextField(3);
        fieldPreco = new JTextField(5);
        
        //buttons
        buttonInserir = new JButton("Inserir");
        //buttonInserir.addActionListener(...);
        buttonFechar = new JButton("Fechar");
        //buttonFechar.addActionListener(...);
        
        panel.add(labelId);
        panel.add(fieldId);
        panel.add(labelNome);
        panel.add(fieldNome);
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
    
    private void inserir() {
        //completar aqui
    }
    
    private void fechar() {
        dispose();
    }
}
