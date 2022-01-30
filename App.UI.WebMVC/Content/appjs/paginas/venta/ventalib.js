var VENTA_STORAGE_NAME = 'Venta';

function init() {
    $(".agregarProducto").on("click", AgregarProducto)
    $(".confirmarVenta").on("click", ConfirmarVenta)
    MostrarVentaHtml("detalle");
}

function initConfirmarVenta() {
    $(".grabar").on("click", GrabarVenta)
    MostrarVentaHtml("detalle");
}

function GrabarVenta() {
    var venta = ObtenerVentaStorage();

    $.post("/venta/grabar", venta,
        function (response) {
            alert(response);
        }

    )


}

function AgregarProducto() {
    //debugger;
    var productoId = $("#producto").val();
    var productoName = $("#producto option:selected").text();
    var precio = parseInt($("#precio").val());
    var cantidad = parseInt($("#cantidad").val());
    
    var producto = new Producto(productoId, productoName, precio, cantidad);

    if (ExisteProducto(productoId)) {
        alert("El producto ya fue agregado ");
        return;
    }

    if (producto.ValidarProducto()) {
        var venta = ObtenerVentaStorage();
        venta.detalle.push(producto);
        GuardarVentaStorage(venta);

        MostrarVentaHtml("detalle");
    }
    else {
        alert("Datos faltantes del producto");
    }
   
}

function GuardarVentaStorage(venta) {
    localStorage.setItem(VENTA_STORAGE_NAME, JSON.stringify(venta));
}

function ObtenerVentaStorage() {
    var venta = {};
    venta.detalle = []; //arreglo de datos

    if (localStorage.getItem(VENTA_STORAGE_NAME) != null) {
        /*
         {
            Total :100,
            Detalle : [
                {
                    Codigo:1, Nombre:"", Precio:"", Cantidad:""
                 },
                {}
            ]
         }
         
         */
        venta = JSON.parse(localStorage.getItem(VENTA_STORAGE_NAME));
    }

    return venta;
}

function ConfirmarVenta() {
    //permite redireccionar hacia otra página
    location.href = "/venta/confirmar";
}

function MostrarVentaHtml(idContenedor) {
    var venta = ObtenerVentaStorage();
    var tabla = "<table class='table'>";
    tabla += "<tr>";
    tabla += "  <th>Código</th>";
    tabla += "  <th>Nombre</th>";
    tabla += "  <th>Precio</th>";
    tabla += "  <th>Cantidad</th>";
    tabla += "  <th>Sub Toal</th>";
    tabla += "  <th></th>";
    tabla += "</tr>";

    for (var i = 0; i < venta.detalle.length; i++) {
        tabla += "<tr>";
        tabla += "  <td>" + venta.detalle[i].Codigo + "</td>";
        tabla += "  <td>" + venta.detalle[i].Nombre + "</td>";
        tabla += "  <td>" + venta.detalle[i].Precio + "</td>";
        tabla += "  <td>" + venta.detalle[i].Cantidad + "</td>";
        tabla += "  <td>" + venta.detalle[i].SubTotal + "</td>";
        tabla += "  <td><button class='btn btn-danger' onClick='Eliminar(" + venta.detalle[i].Codigo +")'>Eliminar</button></td>";
        tabla += "</tr>";
    }

    tabla += "</table>";

    $("#" + idContenedor).html(tabla);
    
}

function ExisteProducto(codigoProducto) {
    var venta = ObtenerVentaStorage();
    for (var i = 0; i < venta.detalle.length; i++) {
        if (venta.detalle[i].Codigo == codigoProducto) return true;
    }
    return false;
}

function Eliminar(codigo) {
    var venta = ObtenerVentaStorage();
    for (var i = 0; i < venta.detalle.length; i++) {
        if (venta.detalle[i].Codigo == codigo) {
            venta.detalle.splice(i, 1);
        }
    }

    GuardarVentaStorage(venta);
    MostrarVentaHtml("detalle");
}