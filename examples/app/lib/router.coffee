FlowRouter.route '/',
  name: 'home'
  subscriptions: (params, queryParams) ->
    page = parseInt(queryParams.page) or 0
    limit = 2
    offset = page*limit
    this.register('postsWithSkip', Meteor.subscribe('postsWithSkip', offset, limit))
  action: (params, queryParams) ->
    FlowLayout.render 'demo'