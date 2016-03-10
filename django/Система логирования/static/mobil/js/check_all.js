function prepare_check_all() {
    $(function() {
        $('#checkall').change(function(){
            var checkboxes = $(this).closest('table').find(':checkbox');
            if($(this).prop('checked')) {
              checkboxes.prop('checked', true);
            } else {
              checkboxes.prop('checked', false);
            }
        });
    });
}