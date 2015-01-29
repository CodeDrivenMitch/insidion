class AddAttachmentToBlockImage < ActiveRecord::Migration
  def self.up
    add_attachment :block_images, :image
  end

  def self.down
    remove_attachment :block_images, :image
  end
end
