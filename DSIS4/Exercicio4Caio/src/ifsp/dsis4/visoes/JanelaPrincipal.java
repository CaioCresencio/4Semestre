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
    //private ListaEntidade lista;
    private JTextField nomeT;
    private JComboBox combo;
    
    
    public JanelaPrincipal() {
        super("Janela de Listagem");
        System.out.println(Thread.currentThread().getName());
        criarComponentes();
        configurarJanela();
        listarCombo();
    }
    
    private void criarComponentes() {
        panel = new JPanel();
        panel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(), "Listagem de entidades"));
        
        model = new DefaultTableModel();
        table = new JTable();
        table.setModel(model);
        table.setFillsViewportHeight(true);
        
        combo = new JComboBox();

        scroll = new JScrollPane();
        scroll.setViewportView(table);
        
        buttonListar = new JButton("Listar");
        buttonListar.addActionListener(event -> buscarEntidades());
        
        buttonFechar = new JButton("Fechar");
        buttonFechar.addActionListener(event -> fechar());
        
        panel.add(combo);
        panel.add(buttonListar);
        panel.add(buttonFechar);
        panel.add(scroll);
        add(panel);
    }
    
    private void configurarJanela() {
        setVisible(true);
        pack();
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    
    private void buscarEntidades() {
        EntidadeBD entBD = new EntidadeBD();
        String nomeTabela = String.valueOf(combo.getSelectedItem());
       
        //ListaEntidade lista = entBD.buscarEntidades(nomeTabela);
        
        ListaEntidade lista = entBD.listaIntervalo(100, 90);
        
        
        model.setDataVector(lista.toAarray2d(),lista.getCOlunas());
    }
    private void listarCombo(){
        EntidadeBD entBD = new EntidadeBD();
        List<String> tabelas = entBD.listaTabelas();
        for(String l: tabelas){
            combo.addItem(l);
        }
    }
    
    private void fechar() {
        dispose();
    }
}

