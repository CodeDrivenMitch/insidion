class BlockImage < ActiveRecord::Base
  belongs_to :block
  has_one :upload
end
