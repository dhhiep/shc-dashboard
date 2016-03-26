$(document).on 'page:fetch', ->
  console.log 'loading'
  NProgress.start()

$(document).on 'page:change', ->
  console.log 'done'
  NProgress.done()