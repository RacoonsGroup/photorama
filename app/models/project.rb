# encoding=utf-8
class Project < ActiveRecord::Base
  attr_accessible :subdomain, :title, :template_id
  belongs_to :user
  belongs_to :template

  has_many :page_modules

  validates :title, :subdomain, presence: true
  validates :title, :subdomain, length: { minimum: 2 }
  validates :subdomain, uniqueness: true
  validates :subdomain, format: { with: /^[a-z0-9][a-z0-9\-]*[a-z0-9]$/,
                                  message: "в названии субдомена не должно быть спец.символов" }
end
