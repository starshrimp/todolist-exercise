class Todo
  def initialize(title, completed)
    @title = title
    @completed = completed
  end

  def title
    @title
  end

  def completed?
    @completed
  end

  def completed=(value)
    @completed = value
  end
end
