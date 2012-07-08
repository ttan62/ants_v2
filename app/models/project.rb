class Project < ActiveRecord::Base
  attr_accessible :description, :name, :user

  has_many :notes, dependent: :destroy

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
