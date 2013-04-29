# Helper methods defined here can be accessed in any controller or view in the application

Michishirube::App.helpers do
  def year_collection
    collection = []
    first = Date.current
    (0..2).each do |i|
      collection << (first + i.year).strftime("%Y")
    end
    collection
  end

  def month_collection
    collection = []
    (1..12).each do |i|
      collection << i.to_s
    end
    collection
  end

  def day_collection
    collection = []
    (1..31).each do |i|
      collection << i.to_s
    end
    collection
  end
end
