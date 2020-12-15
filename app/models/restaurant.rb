class Restaurant < ApplicationRecord
  validates_presence_of :address, on: :create, message: "can't be blank"
  validates :style, inclusion: { in: %w[Italian Lebanese Japanese Belgian French Chinese] }
end
