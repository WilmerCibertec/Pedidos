function Producto(codigo, nombre, precio,cantidad) {
    this.Codigo = codigo;
    this.Nombre = nombre;
    this.Precio = precio;
    this.Cantidad = cantidad;
    this.SubTotal = this.Precio * this.Cantidad;

    this.ValidarProducto = function () {
        return this.Codigo != "" && this.Nombre != ""
            && this.Cantidad > 0 && this.Precio > 0;
    }
}
/*
 * Para crear una instancia de producto
var prod = new Producto()
*/