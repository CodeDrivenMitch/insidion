$(document).ready(function() {
   $('#block_blockable_type').change(checkType);
    checkType();
});

function checkType() {
    var currentType = $('#block_blockable_type').val();
    var allTypeDivs = $('div.form-part');
    allTypeDivs.each(function() {
        if($(this).data()['type'] == currentType.toLowerCase()) {
            $(this).show();
        } else {
            $(this).hide();
        }
    })
}
