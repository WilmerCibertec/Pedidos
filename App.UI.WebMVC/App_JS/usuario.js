(function (usuario) {
    usuario.success = successReload;
    usuario.searchByFilter = searchByFilter;

    $("#CreationDate").daterangepicker();

    $('.select2').select2();

    initPaginacion();

    function successReload(option) {
        appPedidos.closeModal(option);
        getusuarios();
    }

    function initPaginacion() {
        $("#usuarioTable").dataTable().fnDestroy();

        $('#usuarioTable').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "autoWidth": true,
            "responsive": true,
            "buttons": ["copy", "csv", "excel", "pdf"]
        }).buttons().container().prependTo("#usuarioTableContainer");
    }

    function getusuarios() {
        var url = '/usuario/List';
        console.log(url);
        $.get(url, function (data) {
            $('#usuarioList').html(data);
            initPaginacion();
        })
    }

    function searchByFilter() {
        var correoID = document.getElementById("correoID");

        console.log(correoID.value+'----'/* + emailID.value*/
        );
        //console.log(tipousuarioViewBag);
        //console.log(tipousuarioViewData);

        if (correoID.value == '') correoID.value = '-';
        //if (emailID.value == '') emailID.value = '-';

        //var url = 'usuario/ListByFilters/?correoID=' + correoID.value + '&&usuarioNombre=' + emailID.value;
        var url = '/Usuario/ListByFilters/' + correoID.value/* + '/' + emailID.value*/
            ;
        console.log(url);
        $.get(url, function (data) {
            $('#usuarioList').html(data);
            initPaginacion();
        })
    }

})(window.usuario = window.usuario || {})