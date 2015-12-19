class Project < ActiveRecord::Base
  has_many :todos, dependent: :destroy
  accepts_nested_attributes_for :todos
end
