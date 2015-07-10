Template.body.helpers
  posts: -> posts.find({}, {limit: 2, sort: {createdAt: 1}})