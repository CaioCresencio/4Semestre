/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ifsp.dsis4.visoes;

import ifsp.dsis4.bd.EntidadeBD;
import java.util.List;
import javax.swing.JLabel;
import javax.swing.SwingWorker;

/**
 *
 * @author caio
 */
public class InsercaoBackground extends SwingWorker<Integer,String>{
    private JLabel label;
    
    public InsercaoBackground(JLabel label){
        this.label = label;
    }
    @Override
    protected Integer doInBackground() throws Exception {
        EntidadeBD entidadeBD = new EntidadeBD();
        try{
            for(int i =0; i<100000;i++){
                entidadeBD.salvarEntidade(i,"Teste");
                publish("titulo: "+i);
                setProgress(100*(i+1)/100000);
            }
        }catch(Exception e ){
            e.printStackTrace();
            throw new Exception(e);
        }
        return entidadeBD.calcularTotal();
    }
    @Override
    protected void done(){
        try{
            label.setText(String.valueOf(get()));
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    @Override
    protected void process(List<String> lista){
        System.out.println(lista);
    }
    
}
