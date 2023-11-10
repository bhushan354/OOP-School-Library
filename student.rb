require_relative 'person'

class Student < Person
  attr_accessor :classroom :name

  def initialize(classroom:, name: 'Unknown', age: 0, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @name = name
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
