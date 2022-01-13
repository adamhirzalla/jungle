class Sale < ActiveRecord::Base

  validates :name, :starts_on, :ends_on, :percent_off, presence: true

  # AR Scope
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)    
  end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    Date.current < starts_on
  end

  def active?
    !upcoming? && !finished?
  end

end
