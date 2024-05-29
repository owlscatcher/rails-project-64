# frozen_string_literal: true

Rails.logger.debug 'Seeding started'

# NOTE: how to start a named seed
#   'SEED_NAME=post_likes rails db:seed'
seed_file = ENV.fetch('SEED_NAME', nil)

if seed_file.present?
  require_relative "seeds/#{seed_file}"
else
  require_relative 'seeds/users'
  require_relative 'seeds/categories'
  require_relative 'seeds/posts'
  require_relative 'seeds/post_comments'
  require_relative 'seeds/post_likes'
end
