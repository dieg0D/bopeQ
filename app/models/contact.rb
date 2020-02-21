class Contact < ApplicationRecord
  belongs_to :primary, :class_name => "User"
  belongs_to :secondary, :class_name => "User"
end
