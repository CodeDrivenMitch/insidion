class Block < ActiveRecord::Base
  belongs_to :blockable, :polymorphic => true, :autosave=>true
  has_many :block_images
  validates_presence_of :blockable, :title, :active

  accepts_nested_attributes_for :blockable, allow_destroy: true
  accepts_nested_attributes_for :block_images, allow_destroy: true

  # Needed to workaround polymorphic one-to-one association
  def blockable_attributes=(blockable_attributes, options = {})
    Rails.logger.info blockable_attributes
    return unless self.blockable_type and not self.blockable_type.empty?
    self.blockable ||= blockable_type.constantize.new
    blockable.assign_attributes(blockable_attributes)
  end
end
