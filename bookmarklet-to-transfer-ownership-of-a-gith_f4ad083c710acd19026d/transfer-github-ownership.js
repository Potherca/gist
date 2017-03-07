var sRepo = $('#rename_field').val()
  , sName = $('[itemprop=title]').text() + '-contrib';
  
/* Open "Transfer Ownership" modal dialog */
$('#transfer_button').trigger('click');
/* Set input values */
$('#confirm_repository_name').val(sRepo);
$('#confirm_new_owner').val(sName);
/* Submit the form */
$('[action*=transfer] button[type=submit]').removeAttr('disabled').trigger('click');
`
/*EOF*/