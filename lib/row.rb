class Row
  attr_accessor :title, :work, :salary
  def initialize(params)
    @title = params[0]
    @work = params[1]
    @salary = params[2]
  end

  def report
    "Title of #{@title} with a salary of #{@salary}"
  end
end