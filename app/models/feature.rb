class Feature
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :n, as: :name, :type => String
  field :dl, as: :deadline, :type => DateTime

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  validates :name, presence: true

  def deadline_year
    deadline ? deadline.strftime("%Y") : ''
  end

  def deadline_month
    deadline ? deadline.strftime("%m").to_i.to_s : ''
  end

  def deadline_day
    deadline ? deadline.strftime("%d").to_i.to_s : ''
  end

  def no_deadline
    deadline.nil?
  end

  def set_deadline(year, month, day)
    self.deadline = DateTime.parse("#{year}-#{month}-#{day} 00:00:00+09:00")
  end
end
