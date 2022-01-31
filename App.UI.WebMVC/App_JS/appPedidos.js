(function (appPedidos) {
    appPedidos.getModal = getModalContent;
    appPedidos.closeModal = closeModal;

    function getModalContent(url) {
        $.get(url, function (data) {
            $('.modal-body').html(data);
        })
    }
    function closeModal(option) {
        $("button[data-dismiss='modal']").click();
        $('.modal-body').html('');
        MostrarAlerta(option);
    }

    function MostrarAlerta(option) {
        //$("#createMessage").addClass('hidden');
        $("#createMessage").attr('hidden', 'hidden');
        //$("#editMessage").addClass('hidden');
        $("#editMessage").attr('hidden', 'hidden');
        //$("#deleteMessage").addClass('hidden');
        $("#deleteMessage").attr('hidden', 'hidden');

        if (option === 'create') {
            //$("#createMessage").removeClass('hidden');
            $("#createMessage").removeAttr('hidden');

            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Creación Correcta!',
                text: 'Se creó el registro satisfactoriamente!',
                timer: 15000, //milisegundos
                //confirmButtonText: 'Está seguro?',
                showConfirmButton: true,
                showCloseButton: true
            })
        }
        else if (option === 'edit') {
            //$("#editMessage").removeClass('hidden');
            $("#editMessage").removeAttr('hidden');

            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Edición Correcta!',
                text: 'Se editó el registro satisfactoriamente!',
                timer: 5000, //milisegundos
                //confirmButtonText: 'Está seguro?',
                showConfirmButton: true,
                showCloseButton: true
            })
        }
        else if (option === 'delete') {
            //$("#deleteMessage").removeClass('hidden');
            $("#deleteMessage").removeAttr('hidden');

            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Eliminación Correcta!',
                text: 'Se eliminó el registro satisfactoriamente!',
                timer: 5000, //milisegundos
                //confirmButtonText: 'Está seguro?',
                showConfirmButton: true,
                showCloseButton: true
            })
        }

        window.setTimeout(function () {
            $(".alert").fadeTo(2000, 0).slideUp(1000, function () {
                $(this).remove();
            });
        }, 2000)
    }

})(window.appPedidos = window.appPedidos || {})