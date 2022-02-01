(function (cliente) {
    cliente.success = successReload;
    initPaginacion();

    function successReload(option) {
        appVentas.closeModal(option);
    }

    function initPaginacion() {
        $('#clienteTable').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "autoWidth": false,
            "responsive": false/*,
            "buttons":["copy","csv","excel","pdf"]*/
        });
    }
})(window.cliente = window.cliente || {})