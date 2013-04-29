require 'spec_helper'

describe Task do

  before(:each) do
    @task = Task.new(name: 'aaa', status: :todo, point: 2)
  end

  it "is valid with valid attributes" do
    @task.should be_valid
  end

  it "is not valid with no name" do
    @task.name = nil
    @task.should_not be_valid
  end

  it "is not valid with too long name" do
    too_long_name = ''
    81.times { too_long_name += 'a' }
    @task.name = too_long_name
    @task.should_not be_valid
  end

  it "is not valid with duplicating name" do
    task = Task.create(name: 'aaa', status: :todo, point: 2)
    @task.should_not be_valid
  end

  it "is not valid with not defined status" do
    @task.status = :not_defined
    @task.should_not be_valid
  end

  it "is not valid with point greater than 10" do
    @task.point = 11
    @task.should_not be_valid
  end

end

