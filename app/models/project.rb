class Project < ActiveRecord::Base
  attr_accessible :description, :name, :user

  has_many :notes, dependent: :destroy

  def self.search(search)
    if search
      search = "%#{search}%".strip
      if search != ''
          find(:all, :conditions => ['name LIKE ? or description LIKE ?', 
          search,
          search])
      else
        find(:all)
      end
    else
      find(:all)
    end
  end
end
