Template.body.helpers
  posts: -> posts.find({}, {limit: limit, sort: {createdAt: 1}})
  limit: -> limit