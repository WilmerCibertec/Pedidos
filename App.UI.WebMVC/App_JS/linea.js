(function (linea) {
    linea.success = successReload;
    linea.searchByFilter = searchByFilter;

    initPaginacion();

    function successReload(option) {
        appPedidos.closeModal(option);
    }

    function initPaginacion() {
        $('#lineaTable').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "autoWidth": false,
            "responsive": false/*,
            "buttons":["copy","csv","excel","pdf"]*/
        });
    }

    function searchByFilter() {
        var descripcionId = document.getElementById("descripcionId");
        var aux = document.getElementById("estadoId");
        var estadoId;
        switch (aux.value) {
            case "Activo":
                    estadoId = 1;
                break;
            case "Inactivo":
                    estadoId = 0;
                break;
            default:
        break;
        }
        console.log(descripcionId.value + '----' + estadoId);

        if (descripcionId.value == '') descripcionId.value = '-';
        if (estadoId == '') estadoId = '-';


        //var url = 'Categoria/ListByFilters/?categoriaId=' + categoriaId.value + '&&categoriaNombre=' + categoriaName.value;
        var url = 'Linea/ListByFilters/' + descripcionId.value + '/' + estadoId;
        $.get(url, function (data) {
            $('#lineaList').html(data);
            initPaginacion();
        })
    }

})(window.linea = window.linea || {})