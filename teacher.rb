require './person'

class Teacher < Person
  def initialize(name = 'Unknown', specialization, age)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
