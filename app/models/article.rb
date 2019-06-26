class Article < ApplicationRecord
attr_accessor :destroyed
after_destroy :mark_as_destroyed
def mark_as_destroyed
  self.destroyed = true
end
end
