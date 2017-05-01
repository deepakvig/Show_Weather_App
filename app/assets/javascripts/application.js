//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$("#submit-button").on('click', function(){
		$('#notice').addClass('hide');
	})
})