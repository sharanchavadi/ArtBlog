$('#new_comment')[0].reset();
$("#articleComments").html("<%= escape_javascript(render 'comment') %>")