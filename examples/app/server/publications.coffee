if posts.find({}).count() == 0
  posts.insert title: 'hello world', createdAt: new Date()
  posts.insert title: 'insert coint', createdAt: new Date()
  posts.insert title: 'game over!', createdAt: new Date()
  posts.insert title: 'street fighter ii', createdAt: new Date()
  posts.insert title: 'final fight', createdAt: new Date()
  posts.insert title: 'super mario', createdAt: new Date()


Meteor.publish 'postsWithSkip', (skip, limit) ->
  Counts.publish(this, 'total_posts', posts.find())
  if skip < 0 then skip = 0
  options = {}
  options.skip = skip
  options.limit = limit
  if options.limit > 10 then options.limit = 10
  options.sort = {createdAt: 1}
  posts.find({}, options)