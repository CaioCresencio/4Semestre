/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.front;

import ifsp.dsis4.banco.ControladorBD;
import java.awt.event.ActionEvent;
import java.util.List;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JInternalFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author caio
 */
public class Consulta extends JInternalFrame {
    private JTable table;
    private DefaultTableModel model;
    private JButton proximo;
    private JButton anterior;
    private JPanel panel;
    private JScrollPane scroll;
    private int posicao;
    
    public Consulta(){
        super("Consulta",true,true,true,true);
        gerarComponentes();
        configurarComponentes();
        posicao = 0;
    }
    private void gerarComponentes(){
        panel = new JPanel();
        panel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(),"Tabela"));
        
        model = new DefaultTableModel();
        
        gerarCampos();
      
        this.table = new JTable(model);
        table.setFillsViewportHeight(true);
        scroll = new JScrollPane();
        scroll.setViewportView(table);
       
        proximo = new JButton(" > ");
        proximo.addActionListener(this::buscarProximo);
        anterior = new JButton(" < ");
        anterior.addActionListener(this::buscarAnterior);
        
        panel.add(anterior);
        panel.add(proximo);
        panel.add(scroll);
        add(panel);
        
    }
    private void configurarComponentes(){
         setVisible(true);
        //setSize(600,200);
        pack();
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
    }
    private void buscarAnterior(ActionEvent e){
        ControladorBD cBD = new ControladorBD();
        List<String[]>lista = cBD.getDados();
        
        if(this.posicao > 0){
            model.setNumRows(0);
            posicao--;
            int inicio = posicao*50;
            int fim = inicio+50;
            while(inicio < fim && inicio < lista.size() ){ 
                model.addRow(lista.get(inicio));
                inicio++;
            }
        }
       
    } 
    private void buscarProximo(ActionEvent e){
        ControladorBD cBD = new ControladorBD();
        List<String[]>lista = cBD.getDados();
        
        int inicio = (posicao+1)* 50;
        int fim = inicio+50;
        if(inicio < lista.size()){
            model.setNumRows(0);
            for(int i = inicio ; inicio < fim  && i < lista.size(); i++){
                model.addRow(lista.get(i));
            }
             posicao++;
        }
       
    }
    private void gerarCampos(){
        ControladorBD cBD = new ControladorBD();
        String[]lista = cBD.getTabela();
        if(lista != null){
            for(String s: lista){
                model.addColumn(s);
            }
        }
        List<String[]>listaD = cBD.getDados();
        if(listaD != null){
            for(int i=0; i<listaD.size();i++){
                model.addRow(listaD.get(i));
            }
        }
        
    }
}
