package ifsp.dsis4.visoes;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author DênisLeonardo
 */

import java.awt.event.ActionEvent;
import javax.swing.JFrame;
import javax.swing.JDesktopPane;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JInternalFrame;

public class JanelaPrincipal extends JFrame {

    private JDesktopPane desktop;
    //permite gerenciar múltiplas janelas internas
    
    private JMenuBar barra;
    //barra de menus
    
    private JMenu menuArquivo;
    //menu que ficará na barra de menus
    
    private JMenuItem itemCadastro;
    private JMenuItem itemListagem;
    private JMenuItem itemSair;
    //itens que farão parte do menu
    
    public JanelaPrincipal() {
        super("Exercício 2 para entregar");
        criarComponentes();
        configurarJanela();
    }
    
    private void criarComponentes() {
        desktop = new JDesktopPane();
        
        barra = new JMenuBar();
        
        menuArquivo = new JMenu("Arquivo");
        //menu.setText("Arquivo");
        
        itemCadastro = new JMenuItem("Tela de cadastro");
        itemCadastro.addActionListener(this::abrirJanelaCadastro);
        
        itemListagem = new JMenuItem("Tela de consulta");
        itemListagem.addActionListener(this::abrirJanelaListagem);
        
        itemSair = new JMenuItem("Sair");
        itemSair.addActionListener(this::sair);
        
        menuArquivo.add(itemCadastro);
        menuArquivo.add(itemListagem);
        menuArquivo.addSeparator();
        menuArquivo.add(itemSair);
        
        barra.add(menuArquivo);
        
        setJMenuBar(barra);
        
        add(desktop);
    }
    
    private void configurarJanela() {
        setVisible(true);
        setSize(1200,800);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    
    private void carregarJanela(JInternalFrame janela) {
        desktop.add(janela);
        desktop.moveToFront(janela);
    }
    
    private void abrirJanelaCadastro(ActionEvent e) {
        JanelaCadastro janelaCadastro = new JanelaCadastro();
        carregarJanela(janelaCadastro);
    }
    
    private void abrirJanelaListagem(ActionEvent e) {
        JanelaListagem janelaListagem = new JanelaListagem();
        carregarJanela(janelaListagem);
    }
    
    private void sair(ActionEvent e) {
        System.exit(0);
    }
}
