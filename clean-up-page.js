/*
    Copy/paste the following code into https://en.wikipedia.org/wiki/Anti-pattern
    to get a cleaned up version of that page.
*/
/* Remove everything but the actual content container */
$('body').html($('#mw-content-text'));
/* Remove everything before the example list*/
$('#Examples').parent().prevAll().remove();
$('#Examples').parent().remove();
/* Remove everything after the part that is useful for most */
$('#Configuration_management').parent().nextAll().remove();
$('#Configuration_management').parent().remove();
/* Remove edit- and reference-buttons */
$('.mw-editsection, .reference').remove();
