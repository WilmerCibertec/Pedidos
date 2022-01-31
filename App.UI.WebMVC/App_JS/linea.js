(function (linea) {
    linea.success = successReload;
    initPaginacion();

    function successReload(option) {
        appVentas.closeModal(option);
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
})(window.linea = window.linea || {})