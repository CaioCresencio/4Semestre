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
    private JButton buttonProx;
    private JButton buttonAnt;
    private ListaEntidade lista;
    private JTextField nomeT;
    private JComboBox combo;
    private ControlePag controle;
    
    
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
        
        buttonProx = new JButton(" > ");
        buttonProx.addActionListener(event -> buscaProx());
        buttonAnt = new JButton(" < ");
        buttonAnt.addActionListener(event -> buscaAnt());
        
        panel.add(combo);
        panel.add(buttonListar);
        panel.add(buttonFechar);
        panel.add(scroll);
        panel.add(buttonAnt);
        panel.add(buttonProx);
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
        String nomeTabela = String.valueOf(combo.getSelectedItem());
        System.out.println(nomeTabela);
        entBD.listaTabelas();
        controle = new ControlePag(lista);
        lista = entBD.buscarIntervalo(nomeTabela,100,1);
      
        
       // model.setDataVector(lista.toAarray2d(),lista.getCOlunas());
    }
    public void buscaProx(){
        //ListaEntidade conteudo = controle.getProx() ;
        if( controle.getProx() != null){
            ListaEntidade conteudo = controle.getProx();
            model.setDataVector(conteudo.toAarray2d(),conteudo.getCOlunas());
        }
    }
    public void buscaAnt(){
        
    }

    private void listarCombo(){
        EntidadeBD entBD = new EntidadeBD();
        List<String> tabelas = entBD.listaTabelas();
        for(String l: tabelas){
            combo.addItem(l.toString());
        }
    }
    
    private void fechar() {
        dispose();
    }
}

