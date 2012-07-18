console.log('This would be the main JS file.');

$(function()
{
  $('#try-brid').change(function()
  {
    $self = $(this);

    $self.removeClass('valid').removeClass('invalid');
    $('#brid-region').text('');

    $.getJSON('http://brid-api.herokuapp.com/'+$self.val()+'?callback=?', function(r){
      if(r.validation) $self.addClass('valid');
      else $self.addClass('invalid');

      $self.val(r.document);

      if(!!r.origin.length)
      {
        message = 'Documento emitido'; 
        if(r.origin.length == 1)
          $('#brid-region').text(message+' em '+states[r.origin[0]]);
        else
        {
          if(r.origin.join() == ['df', 'go', 'ms', 'mt', 'to'].join())
            $('#brid-region').text(message+' na região Centro-Oeste ou Tocantins');
          else if(r.origin.join() == ['ac', 'am', 'ap', 'pa', 'ro', 'rr'].join())
            $('#brid-region').text(message+' na região Norte');
          else if(r.origin.join() == ['ce', 'ma', 'pi'].join())
            $('#brid-region').text(message+' no norte da região Nordeste');
          else if(r.origin.join() == ['al', 'pb', 'pe', 'rn'].join())
            $('#brid-region').text(message+' na região Nordeste');
          else if(r.origin.join() == ['ba', 'se'].join())
            $('#brid-region').text(message+' no sul da região Nordeste');
          else if(r.origin.join() == ['es', 'rj'].join())
            $('#brid-region').text(message+' no litoral da região Sudeste');
          else if(r.origin.join() == ['pr', 'sc'].join())
            $('#brid-region').text(message+' na região Sul');
        }
      }
    })
  }).focus(function()
  {
    $self = $(this);
    $self.removeClass('invalid');
  });

});
