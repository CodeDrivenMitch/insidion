class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relations
  has_many :blocks

  # Validations
  validates_presence_of :username


  # Methods
  def full_name
    [first_name, last_name].join ' '
  end
end
