class Project < ActiveRecord::Base
  has_one :block, :as => :blockable

  accepts_nested_attributes_for :block
end
