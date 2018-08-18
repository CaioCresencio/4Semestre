/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.principal;

import ifsp.dsis4.visoes.JanelaPrincipal;
import javax.swing.SwingUtilities;

/**
 *
 * @author DênisLeonardo
 */
public class Principal {
    
    public static void main(String args[]) {
        
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                 JanelaPrincipal janela = new JanelaPrincipal();
            }
        
        });
       
    }
}
