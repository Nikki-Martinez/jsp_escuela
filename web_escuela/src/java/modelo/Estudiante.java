/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author guich
 */
public class Estudiante extends Persona {
    Conexion cn;
    private String carnet, sangre, correo_electronico;
    private int id, id_sangre;

    public Estudiante() {
    }

    public Estudiante(String carnet, String correo_electronico, int id, int id_sangre, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.carnet = carnet;
        this.correo_electronico = correo_electronico;
        this.id = id;
        this.id_sangre = id_sangre;
    }


    public String getCarnet() {
        return carnet;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public String getSangre() {
        return sangre;
    }

    public void setSangre(String sangre) {
        this.sangre = sangre;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_sangre() {
        return id_sangre;
    }

    public void setId_sangre(int id_sangre) {
        this.id_sangre = id_sangre;
    }
    
    @Override
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            cn.abrir_conexion();

            String query = "SELECT e.id_estudiante AS id, e.carnet, e.nombre, e.apellido, e.direccion, e.telefono, e.correo_electronico, t.sangre AS tipo, e.fecha_nacimiento, t.id_tipo_sangre FROM estudiantes AS e INNER JOIN tipo_sangres AS t ON e.id_tipo_sangre = t.id_tipo_sangre;";        
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);

            String encabezado[] = {"Id","Carnet","Nombres","Apellidos","Direccion","Telefono","Correo Electronico","Tipo de Sangre","Fecha de Nacimiento", "Id Tipo Sangre"};
            tabla.setColumnIdentifiers(encabezado);

            String datos[] = new String[10]; 

            while(consulta.next()){
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("carnet");
                datos[2] = consulta.getString("nombre");
                datos[3] = consulta.getString("apellido");
                datos[4] = consulta.getString("direccion");
                datos[5] = consulta.getString("telefono");
                datos[6] = consulta.getString("correo_electronico");
                datos[7] = consulta.getString("tipo");
                datos[8] = consulta.getString("fecha_nacimiento");
                datos[9] = consulta.getString("id_tipo_sangre");
                tabla.addRow(datos);
            }
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println("Error en leer: " + ex.getMessage());
        }
        return tabla;
    }

    

    @Override
    public int crear(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();

            String query = "INSERT INTO estudiantes(carnet,nombre,apellido,direccion,telefono,correo_electronico,id_tipo_sangre,fecha_nacimiento) VALUES(?,?,?,?,?,?,?,?)";

            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);

            parametro.setString(1, getCarnet());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getCorreo_electronico());
            parametro.setInt(7, getId_sangre()); 
            parametro.setString(8, getFecha_nacimiento());

            retorno = parametro.executeUpdate();
            System.out.println("Se insertó " + Integer.toString(retorno) + " Registro de Estudiante");
            cn.cerrar_conexion();

        }catch(SQLException ex){
            System.out.println("Error en crear: " + ex.getMessage());
        }
        return retorno;
    }

    

    @Override
    public int actualizar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();

            String query = "UPDATE estudiantes SET carnet=?, nombre=?, apellido=?, direccion=?, telefono=?, correo_electronico=?, id_tipo_sangre=?, fecha_nacimiento=? WHERE id_estudiante = ?;";

            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);

            parametro.setString(1, getCarnet());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getCorreo_electronico());
            parametro.setInt(7, getId_sangre()); 
            parametro.setString(8, getFecha_nacimiento());
            parametro.setInt(9, getId());

            retorno = parametro.executeUpdate();
            System.out.println("Se actualizó " + Integer.toString(retorno) + " Registro de Estudiante");
            cn.cerrar_conexion();

        }catch(SQLException ex){
            System.out.println("Error en actualizar: " + ex.getMessage());
        }
        return retorno;
    }

    

    @Override
    public int borrar(){
        int retorno = 0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            cn.abrir_conexion();

            String query = "DELETE FROM estudiantes WHERE id_estudiante = ?;";

            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());

            retorno = parametro.executeUpdate();
            System.out.println("Se eliminó " + Integer.toString(retorno) + " Registro de Estudiante");
            cn.cerrar_conexion();

        }catch(SQLException ex){
            System.out.println("Error en borrar: " + ex.getMessage());
        }
        return retorno;
    }
    
}
