class Feature
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :n, as: :name, :type => String
  field :dl, as: :deadline, :type => Date

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  validates :name, presence: true
end
