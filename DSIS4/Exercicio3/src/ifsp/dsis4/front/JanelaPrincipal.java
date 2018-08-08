/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.front;

import java.awt.event.ActionEvent;
import javax.swing.JDesktopPane;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

/**
 *
 * @author caio
 */
public class JanelaPrincipal extends JFrame {
    private JDesktopPane desktop;
    private JMenu menu;
    private JMenuItem consultar;
    private JMenuBar barra;
    
    public JanelaPrincipal(){
        super("Exercicio 3");
        gerar();
        configurar();
    }   
    private void gerar(){
        this.desktop = new JDesktopPane();
        this.menu = new JMenu("Arquivo");
        this.barra = new JMenuBar();
        this.consultar = new JMenuItem("Consultar");
        consultar.addActionListener(this::abrirJanela);
        
        
        menu.add(consultar);
        barra.add(menu);
        setJMenuBar(barra);
        add(desktop);
    }
    private void configurar(){
        setVisible(true);
        setSize(1200,800);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    private void abrirJanela(ActionEvent e){
        Consulta con = new Consulta();
        desktop.add(con);
        desktop.moveToFront(con);
        
    }
}
