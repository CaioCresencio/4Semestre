/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.visoes;


import ifsp.dsis4.bd.EntidadeBD;
import ifsp.dsis4.entidades.ListaEntidade;
import java.util.List;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author denis
 */
public class JanelaPrincipal extends JFrame {
    private JPanel panel;
    private JTable table;
    private DefaultTableModel model;
    private JScrollPane scroll;
    private JButton buttonListar;
    private JButton buttonFechar;
    private ListaEntidade lista;
    private JTextField nomeT;
    private JComboBox combo;
    
    
    public JanelaPrincipal() {
        super("Janela de Listagem");
        System.out.println(Thread.currentThread().getName());
        criarComponentes();
        configurarJanela();
    }
    
    private void criarComponentes() {
        panel = new JPanel();
        panel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Listagem de entidades"));
        
        model = new DefaultTableModel();
        table = new JTable();
        table.setModel(model);
        table.setFillsViewportHeight(true);
        
        combo = new JComboBox();
        
        nomeT = new JTextField(10);
        scroll = new JScrollPane();
        scroll.setViewportView(table);
        
        buttonListar = new JButton("Listar");
        buttonListar.addActionListener(event -> buscarEntidades());
        
        buttonFechar = new JButton("Fechar");
        buttonFechar.addActionListener(event -> fechar());
        
        panel.add(nomeT);
        panel.add(buttonListar);
        panel.add(buttonFechar);
        panel.add(scroll);
        add(panel);
    }
    
    private void configurarJanela() {
        setVisible(true);
        //setSize(600,200);
        pack();
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    
    private void buscarEntidades() {
        EntidadeBD entBD = new EntidadeBD();
        String nomeTabela = nomeT.getText();
        ListaEntidade lista = entBD.buscarEntidades(nomeTabela);
        
        
        model.setDataVector(lista.toAarray2d(),lista.getCOlunas());
    }
    
    private void fechar() {
        dispose();
    }
}

