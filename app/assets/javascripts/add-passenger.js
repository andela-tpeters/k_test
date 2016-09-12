$(function(){
    var passenger_count = $('#booking_passenger_count').val();
    for(var i = 0; i < passenger_count; i++) {
        $('.add_passenger').trigger('click');
    }
});
