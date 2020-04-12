/**
 * Update server versions when selected server type
 */
(function($) {
	$(document).ready(function() {
		$("#id_layer").change(function () {
			  const $sel = $(this).find('option:selected');
			  const val = $sel.val();
			  if (val > 0) {
				  $.getJSON(`/ows/props/${val}`).then(response => {
					  // console.debug(response.layer)
					  // remove all options but the first
					  $('#id_property option:gt(0)').remove();
					  const $el = $('#id_property') 
					  Object.keys(response.layer.properties).forEach(p => $el.append(`<option value="${p}">${p}</option>`))
				  })
			  }
		})
	})
})(jQuery);