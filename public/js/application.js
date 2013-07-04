$(document).ready(function() {

  $('.album-list .select_album').on('click',function(){
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: '/album',
      data: {album_id: $(this).attr('data-album')},
      beforeSend: function() {
        $('.photo_partial').fadeTo(200, 0.3);
        $('#loader').fadeIn();
      },
      success: function(data) {
        $('#loader').fadeOut();
        $('.photo_partial').html(data);
        $('.photo_partial').fadeTo(200, 1);
      }
    });
  });

  $('.photo-list').on('click', '#add_photo', function(){
    $('#add_photo_form').slideToggle(100);
  });


});
