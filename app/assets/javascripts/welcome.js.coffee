$ ->
  $('.modal').on 'show', ->
    imgs = $(this).find('img')
    imgs.each (idx,img) ->
      $(img).attr('src', $(img).data('src'))
