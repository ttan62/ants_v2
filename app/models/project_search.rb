class ProjectSearch < ActiveRecord::Base
  attr_accessible :all, :name, :description, :user, :tag
  def projects
    @projects ||= find_projects
  end

  def find_projects
#    Project.find(:all, :conditions => ['name LIKE ?', "%#{name}%"])
    Project.find(:all, :conditions => conditions)
  end

  def name_conditions
    ["projects.name LIKE ?", "%#{name}%"] unless name.blank?
  end
=begin
  def description_conditions
    ["projects.description LIKE ?", "%#{description}%"] unless description.blank?
  end

  def user_conditions
    ["projects.user LIKE ?", "%#{user}%"] unless user.blank?
  end
=end
  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| conditions[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
end
