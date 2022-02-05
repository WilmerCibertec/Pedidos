(function (appPedidos) {
    appPedidos.getModal = getModalContent;
    appPedidos.getModalToggle = getModalToggle;
    appPedidos.getModalToggle2 = getModalToggle2;
    appPedidos.closeModal = closeModal;
    appPedidos.closeModalToggle1 = closeModalToggle1;
    appPedidos.closeModalToggle2 = closeModalToggle2;

    function getModalContent(url, tamanio) {
        $.get(url, function (data) {
            $('#modal-dialog-id').removeClass('modal-xl');
            $('#modal-dialog-id').removeClass('modal-lg');
            $('#modal-dialog-id').removeClass('modal-md');
            $('#modal-dialog-id').removeClass('modal-sm');
            $('#modal-dialog-id').addClass(tamanio);
            $('#modal-dialog-id').find('.modal-body').html(data);
        })
    }

    function getModalToggle(url, tamanio1) {
        $.get(url, function (data) {
            $('#modal-dialog-toggle1').removeClass('modal-xl');
            $('#modal-dialog-toggle1').removeClass('modal-lg');
            $('#modal-dialog-toggle1').removeClass('modal-md');
            $('#modal-dialog-toggle1').removeClass('modal-sm');
            $('#modal-dialog-toggle1').addClass(tamanio1);
            //$('#modal-dialog-toggle1').find('.modal-body').html(data);
            $('#body-toggle1').html(data);
        })
    }

    function getModalToggle2(url, tamanio2) {
        $.get(url, function (data) {
            $('#modal-dialog-toggle2').removeClass('modal-xl');
            $('#modal-dialog-toggle2').removeClass('modal-lg');
            $('#modal-dialog-toggle2').removeClass('modal-md');
            $('#modal-dialog-toggle2').removeClass('modal-sm');
            $('#modal-dialog-toggle2').addClass(tamanio2);
            //$('#modal-dialog-toggle2').find('.modal-body').html(data);
            $('#body-toggle2').html(data);
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
        $("#editMessage").attr('hidden','hidden');
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