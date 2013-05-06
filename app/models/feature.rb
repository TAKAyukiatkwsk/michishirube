class Feature
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :n, as: :name, :type => String
  field :dl, as: :deadline, :type => DateTime

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  has_many :tasks

  validates :name, presence: true

  def deadline_year
    deadline ? deadline.strftime("%Y") : ''
  end

  def deadline_month(options={})
    month = deadline ? deadline.strftime("%m") : ''
    unless options[:padding]
      month = month.to_i.to_s if month != ''
    end
    month
  end

  def deadline_day(options={})
    day = deadline ? deadline.strftime("%d") : ''
    unless options[:padding]
      day = day.to_i.to_s if day != ''
    end
    day
  end

  def no_deadline
    deadline.nil?
  end

  def set_deadline(year, month, day)
    self.deadline = DateTime.parse("#{year}-#{month}-#{day} 00:00:00+09:00")
  end
end
