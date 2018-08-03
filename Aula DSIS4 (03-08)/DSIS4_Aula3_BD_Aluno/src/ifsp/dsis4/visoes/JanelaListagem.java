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
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author denis
 */
public class JanelaListagem extends JInternalFrame {
    
    private JPanel panel;
    private JLabel labelTermo;
    private JTextField fieldTermo;
    private JTable table;
    private DefaultTableModel model;
    private JScrollPane scroll;
    private JButton buttonBuscar;
    private JButton buttonFechar;
    
    public JanelaListagem() {
        super("Janela de Listagem",true,true,true,true);
        criarComponentes();
        configurarJanela();
    }
    
    private void criarComponentes() {
        panel = new JPanel();
        panel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Listagem de empregados"));
        
        labelTermo = new JLabel("Termo:");
        fieldTermo = new JTextField(10);
        
        //criação do JTable com a barra de rolagem
                
        buttonBuscar = new JButton("Buscar");
        //buttonBuscar.addActionListener(...);
        
        buttonFechar = new JButton("Fechar");
        //buttonFechar.addActionListener(...);
        
        panel.add(labelTermo);
        panel.add(fieldTermo);
        panel.add(buttonBuscar);
        panel.add(buttonFechar);
        panel.add(scroll);
        add(panel);
    }
    
    private void configurarJanela() {
        setVisible(true);
        //setSize(600,200);
        pack();
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
    }
    
    private void buscarProdutos() {
        //Completar aqui
    }
    
    private void fechar() {
        dispose();
    }
}

