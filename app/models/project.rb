class Project < ActiveRecord::Base
  attr_accessible :subdomain, :title
  belongs_to :user
end
