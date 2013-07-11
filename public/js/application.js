$(document).ready(function() {
  $('.album-list .icon-plus-sign-alt').on('click', function(){
    $('#create_album').slideToggle();
  });

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

  $('.photo-list').on('click', '.icon-plus-sign-alt', function(){
    $('#add_photo_form').slideToggle(100);
  });

  $('.photo-list').on('change', 'input[type="file"]', function(){
    // $('#add_photo_form form').submit();
    // alert("hello");
  });


});
