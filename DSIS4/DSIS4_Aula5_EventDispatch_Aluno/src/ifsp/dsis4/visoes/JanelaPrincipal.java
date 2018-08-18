/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.visoes;

import ifsp.dsis4.bd.EntidadeBD;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JProgressBar;

/**
 *
 * @author denis
 */
public class JanelaPrincipal extends JFrame {
        private JPanel panel;
    private JLabel label;
    private JButton buttonOK;
    private JButton buttonFechar;
    private JProgressBar bar;
    
    public JanelaPrincipal() {
        super("Janela de teste");
        criarComponentes();
        configurarJanela();
    }
    
    private void criarComponentes() {
        panel = new JPanel();
        
        label = new JLabel();
        
        buttonOK = new JButton("OK");
        buttonOK.addActionListener(event -> salvarEntidades());
        
        buttonFechar = new JButton("Fechar");
        buttonFechar.addActionListener(event -> fechar());
        bar = new JProgressBar();
        bar.setValue(0);
        bar.setStringPainted(true);
        
        
        panel.add(buttonOK);
        panel.add(buttonFechar);
        panel.add(label);
        panel.add(bar);
        add(panel);
    }
    
    private void configurarJanela() {
        setVisible(true);
        setSize(400,100);
        //pack();
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    
    private void salvarEntidades() {
        label.setText("Salvando...");
        EntidadeBD entidadeBD = new EntidadeBD();
        InsercaoBackground ib = new InsercaoBackground(label);
        ib.addPropertyChangeListener(new PropertyChangeListener(){
            @Override
            public void propertyChange(PropertyChangeEvent pce) {
               if(pce.getPropertyName().equals("progress")){
                   bar.setValue(Integer.parseInt(pce.getNewValue().toString()));
               }
            }
        
        
        });
        ib.execute();
    
    }
    
    private void fechar() {
        dispose();
    }
}
