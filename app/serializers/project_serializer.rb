class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :categories, :city, :state
  belongs_to :user
  has_many :project_comments
end
