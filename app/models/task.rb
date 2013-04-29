class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :n, as: :name, type: String
  field :s, as: :status, type: Symbol
  field :p, as: :point, type: Integer, default: 1

  belongs_to :feature

  STATUS = [:todo, :doing, :done]

  validates :name, presence: true, length: { maximum: 80 }, uniqueness: true
  validates :status, inclusion: { in: STATUS }
  validates :point, numericality: { less_than: 11 }

end

