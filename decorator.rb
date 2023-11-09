class Decorator < Nameable
  def initialize(nameable)
    super() # added a super call to initialize the state of parent class
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
