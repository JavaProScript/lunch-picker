class Restaurant < ApplicationRecord
  validates_presence_of :address, :name, message: "can't be blank"
  validates :style, inclusion: { in: %w[Italian Lebanese Japanese Belgian French Chinese Undefined] }
end
