package org.iesbelen.model;

public class FabricanteDTO extends Fabricante {

    private int numProducto;

    public FabricanteDTO(int id, String nombre, int numProducto) {
        this.setIdFabricante(id);
        this.setNombre(nombre);
        this.numProducto = numProducto;
    }

    public FabricanteDTO(Fabricante fabricante, int numProducto) {
        this.setIdFabricante(fabricante.getIdFabricante());
        this.setNombre(fabricante.getNombre());
        this.setNumProducto(numProducto);
    }

    public int getNumProducto() {
        return numProducto;
    }

    public void setNumProducto(int numProducto) {
        this.numProducto = numProducto;
    }
}
