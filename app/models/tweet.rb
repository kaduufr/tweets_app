class Tweet < ApplicationRecord
  validates_presence_of :body
  validates_length_of :body, minimum: 3

  after_create_commit { broadcast_prepend_to :tweets }
  after_update_commit { broadcast_replace_to :tweets }
  after_destroy_commit { broadcast_remove_to :tweets }
end
