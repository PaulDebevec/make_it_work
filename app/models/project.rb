class Project <ApplicationRecord
  validates_presence_of :name, :material

  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    contestants.count
  end

  def contestants_average_experience
    aye = contestants.average(:years_of_experience)
    aye.to_f.round(2)
    # I attempted to put round in the view, but I reveived this error...
    # 'undefined method `round' for nil:NilClass'

    #I also attempted limit(2), but that was
  end
end
