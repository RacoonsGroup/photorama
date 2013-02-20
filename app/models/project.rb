class Project < ActiveRecord::Base
  attr_accessible :subdomain, :title
  belongs_to :user

  validates :title, :subdomain, presence: true
  validates :title, :subdomain, length: { minimum: 2 }
  validates :subdomain, uniqueness: true
end
