# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




# onClick: "$('#custom_ignore').append('#{key_word},'); $(this).css('text-decoration', 'line-through')"

jQuery ->
	$('.counted_word').click ->
		current_ignore = $('#custom_ignore').val()
		if !$(this).hasClass('counted-word-crossed-out')
			#alert('up')
			new_ignore = current_ignore + @text.toLowerCase() + ', '
			$(this).addClass('counted-word-crossed-out')
			

		else
			#alert('down')
			new_ignore = current_ignore.replace(@text.toLowerCase() + ', ', '')
			$(this).removeClass('counted-word-crossed-out')
			
		$('#custom_ignore').val(new_ignore)

