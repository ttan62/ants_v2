class Project < ActiveRecord::Base
  attr_accessible :description, :name, :user

  has_many :notes, dependent: :destroy

  def self.search(search)
    search = search.strip
    if search && search != ''
      find(:all, :conditions => ['name or description or user LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
