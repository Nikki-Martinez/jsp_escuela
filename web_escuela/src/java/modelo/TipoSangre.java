/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author Programador
 */
public class TipoSangre {
    Conexion cn;
    private String sangre;
    private int id_sangre;

    public TipoSangre() {
    }

    public TipoSangre(String puesto, int id_sangre) {
        this.sangre = puesto;
        this.id_sangre = id_sangre;
    }

    public String getSangre() {
        return sangre;
    }

    public void setSangre(String sangre) {
        this.sangre = sangre;
    }

    public int getId_sangre() {
        return id_sangre;
    }

    public void setId_sangre(int id_sangre) {
        this.id_sangre = id_sangre;
    }
    
    
    
    
    public HashMap leer(){
     HashMap<String,String> drop  = new HashMap(); // llave, valor
     try{
         cn  = new Conexion();
         cn.abrir_conexion();
         String query = "select id_tipo_sangre,sangre from tipo_sangres;";
         ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
                
            while(consulta.next()){
                drop.put(consulta.getString("id_tipo_sangre"), consulta.getString("sangre"));
            }
         cn.cerrar_conexion();
     }catch(SQLException ex){
       System.out.println("Error: " + ex.getMessage());
     }
     return drop;
    }
}