console.log('This would be the main JS file.');

$(function()
{
  $('#try-brid').change(function()
  {
    $self = $(this);

    $self.removeClass('valid').removeClass('invalid');

    $.getJSON('http://brid-api.herokuapp.com/'+$self.val()+'?callback=?', function(r){
      if(r.validation) $self.addClass('valid');
      else $self.addClass('invalid');

      $self.val(r.document);
    })
  }).focus(function()
  {
    $self = $(this);
    $self.removeClass('invalid');
  });

});
