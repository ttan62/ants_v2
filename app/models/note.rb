class Note < ActiveRecord::Base
  attr_accessible :content, :description, :name, :note_id, :project_id, :user
 
  belongs_to :project
  def self.search(search)
    if search
      find(:all, :conditions ['name LIKE ?', "%#{search}%"])
    else 
      find(:all)
    end
  end
end
