// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


//jQuery(function() {
//    jQuery("#tabs").tabs();
//});

$(function() {
	$("#tabs").tabs();
});


$(function() {
    $("#accordion").accordion();
});



$(function() {
	$.datepicker.setDefaults( $.datepicker.regional[ "kr" ] );

	var defaultDate = $("#datepicker1").datepicker( "option", "defaultDate" );
    $("#datepicker1").datepicker( { defaultDate: +0, dateFormat: "yy-mm-dd D" } );
    $("#datepicker2").datepicker( { defaultDate: +7, dateFormat: "yy-mm-dd D" } );
});

$(function() {
    $( "input[type=submit]" )
		.button()
		.click(function( event ) {
		event.preventDefault();
	});
});	

$(function() {
	$('.dropdown-toggle').dropdown('toogle');
});

$(function() {
    $('#example').popover('toggle');
});
