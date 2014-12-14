class Block < ActiveRecord::Base
  belongs_to :blockable, :polymorphic => true
  has_many :block_images
  validates_presence_of :blockable

  accepts_nested_attributes_for :blockable
end
