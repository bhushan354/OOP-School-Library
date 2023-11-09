class Decorator < Nameable
    def initialize(nameable)
        @namable = namable
    end

    def correct_name
       @namable.correct_name
    end
end
