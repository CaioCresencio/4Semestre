/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.visoes;

import ifsp.dsis4.bd.ProdutoBD;
import ifsp.dsis4.entidades.Produto;
import ifsp.dsis4.entidades.ProdutoUtil;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.util.List;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

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
        model = new DefaultTableModel();
        model.addColumn("Nome");
        model.addColumn("Data de fabricação");
        model.addColumn("Estoque");
        model.addColumn("Valor");
        model.addColumn("Tempo de existência");
        table = new JTable(model);
        table.setFillsViewportHeight(true);
        //table.setModel(model);
        JTableHeader header = table.getTableHeader();
         header.setPreferredSize(new Dimension(header.getPreferredSize().width,30));
        scroll = new JScrollPane();
        scroll.setViewportView(table);
        scroll.setPreferredSize(new Dimension(scroll.getPreferredSize().width,header.getPreferredSize().height+10*table.getRowHeight()));
        buttonBuscar = new JButton("Buscar");
        buttonBuscar.addActionListener(this::buscarProdutos);
        
        buttonFechar = new JButton("Fechar");
        buttonFechar.addActionListener(this::fechar);
        
        
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
    
    private void buscarProdutos(ActionEvent e) {
        String termo = fieldTermo.getText();
        ProdutoBD produtoBD = new ProdutoBD();
       
        try{
            List<Produto> lista = produtoBD.listarTodosPeloNome(termo);
            for(Produto p: lista){
                
                model.addRow(new ProdutoUtil().toArray(p));
                
            }
        }catch(Exception erro){
            JOptionPane.showMessageDialog(null," Algo deu errado "+erro.getMessage()); 
        }
    }
    
    private void fechar(ActionEvent e) {
        dispose();
    }
}

