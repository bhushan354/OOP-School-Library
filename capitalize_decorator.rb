require_relative './decorator'

class CapitalizeDecorator < Decorator
    def correct_name
      return @nameable.correct_name.capitalize if @nameable
  
      # Return a default value or handle the case when @nameable is nil
      "Unknown"
    end
  end
  