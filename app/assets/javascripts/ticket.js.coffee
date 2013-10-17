# Place all the behaviors and hooks related to the matching controller here.
	# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$("[data-toggle='tooltip']").tooltip();

	# add comment button
	$("#addComment").click ->
		if event.preventDefault then event.preventDefault() else (event.returnValue = false)
		val = $(this).data('btn-type')
		parent = $(this).parent()
		form = $('.comment-form')
		span = $('.context').find('span:not(:visible)')
		send = $(form).find('input[value=Send]')
		form.show()
		$(span).show()
		$(form).find("textarea").val("")
		$("blockquote .comment > .context >  a").show()
		send.attr({'data-type': 'add', 'data-link': $(this).data('target')})

	edit_event_handler = (ele) ->
		if event.preventDefault then event.preventDefault() else (event.returnValue = false)
		val = $(ele).data('btn-type')
		form = $('.comment-form')
		span = $(ele).siblings('span')
		send = $(form).find('input[value=Send]')
		$("blockquote .comment > .context >  a").hide()
		form.show()
		$(span).hide()
		$(form).find("textarea").val($(span).text())
		send.attr({'data-type': 'edit', 'data-link': $(ele).data('target')})


	# edit comment button
	$("blockquote .comment > .context >  a").click ->
		edit_event_handler(this)


	# reply form
	$(".reply>form.reply-comment>input[type=submit]").click ->
		if event.preventDefault then event.preventDefault() else (event.returnValue = false)
		link = $(this).data 'link'
		context = $(this).siblings('textarea').val()
		$.ajax link,
			type: 'POST'
			data: {context: context}
			success: (data) ->
				$('#reply_'+ data.comment_id + '>ul').append ('<li><p>'+data.context+'</p></li>')
				$(".reply>form.reply-comment>textarea").val ""
				$(".reply>form.reply-comment").hide()
				$("blockquote .reply>a").show()

	# submit new comment or modify a comment
	$('.comment-form>input[type=submit]').click ->
		if event.preventDefault then event.preventDefault() else (event.returnValue = false)
		text = $(this).data('type')
		link = $(this).data('link')
		context = $('.comment-form>textarea').val()
		$.ajax link,
			type: 'POST'
			data: {context: context}
			success: (data) ->
				if text == "add"
					$(".comment>.context>a").remove()
					link = $('<a>').attr({href: '#', class: 'flat-btn pull-right', 'data-btn-type': 'edit', 'data-target': "/comment/edit/" + data.id }).append('<i class="icon-edit"></i>')
					link.click ->
						edit_event_handler
					new_comment = $('<blockquote>').append($('<div>').addClass('comment').append($('<div>').addClass('context').append($('<span>').append($('<p>').text(data.context))).append(link)))
					new_comment.insertBefore($('form.comment-form'))
				else if text == 'edit'
					$('.comment>.context>#comment_' + data.id).find('p').remove()
					$('.comment>.context>#comment_' + data.id).append($('<p>').text(data.context))
					$('.comment>.context>#comment_' + data.id).show()
					$("blockquote .comment > .context >  a").show()
				$('.comment-form').hide()


	$('.comment-form>a').click ->
		if event.preventDefault then event.preventDefault() else (event.returnValue = false)
		$('.comment-form').hide()
		$("blockquote .comment > .context > span").show()
		$("blockquote .comment > .context >  a").show()



	# reply
	$("blockquote .reply>a").click ->
		if event.preventDefault then event.preventDefault() else (event.returnValue = false)
		$("#reply" + $(this).data('id')).show()
		$(this).hide()

	$(this).parent().prev().show()
	$("blockquote a").show()
	$(this).hide()

jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
