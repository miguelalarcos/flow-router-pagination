Template.paginationBar.helpers
  pages: (count) ->
    current = parseInt(FlowRouter.getQueryParam('page')) or 0
    total = Math.ceil(Counts.get(count)/this.itemsPerPage)
    paginationBar(this.window, total, current)
  pageNumber: -> this + 1
  selected: ->
    current = parseInt(FlowRouter.getQueryParam('page')) or 0
    if parseInt(this) == current then 'page-selected' else ''
  showMinus: ->
    current = parseInt(FlowRouter.getQueryParam('page')) or 0
    current != 0
  showPlus: (count) ->
    current = parseInt(FlowRouter.getQueryParam('page')) or 0
    total = Math.ceil(Counts.get(count)/this.itemsPerPage)
    all = paginationBar(this.window, total, current)
    current != all[-1..][0]

Template.paginationBar.events
  'click .plus': (e, t) ->
    current = parseInt(FlowRouter.getQueryParam('page')) or 0
    FlowRouter.setQueryParams({page: current + 1})
  'click .minus': (e, t) ->
    current = parseInt(FlowRouter.getQueryParam('page')) or 0
    FlowRouter.setQueryParams({page: current - 1})
  'click .change-page': (e, t) ->
    page = $(e.target).attr('page')
    page = parseInt(page)
    FlowRouter.setQueryParams({page: page})

paginationBar = (pwindow, total, current) ->
  middle = Math.ceil(pwindow/2)
  ini = current - middle
  end = current + middle
  if ini < 0
    ini = 0
    if total > pwindow
      end = pwindow
    else
      end = total
  else if end >= total
    end = total
    ini = end - pwindow
    if ini < 0 then ini = 0

  [ini...end]

