var AJAX_PROXY_URL = '/activities/feed';
var AJAX_TIMEOUT_SECONDS = 5;
var MINIMUM_RESPONSE_CHARACTERS = 50;

function update_feed(){	
	$.ajax({
		url: AJAX_PROXY_URL,
		type: 'GET',
		dataType: 'html',
		timeout: AJAX_TIMEOUT_SECONDS * 1000,
		success: function(response_html){
			if(response_html.length > MINIMUM_RESPONSE_CHARACTERS){
				$("#rails_activity_feed_box")[0].innerHTML = response_html;
			}
		},
		error: function(xml, status, error_thrown){
		}
	});
}
