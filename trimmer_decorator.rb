class TrimmerDecorator < Decorator
    def correct_name
      nameable_name = @nameable&.correct_name
  
      if nameable_name
        return nameable_name.length > 10 ? nameable_name[0, 10] : nameable_name
      end
  
      # Return a default value or handle the case when @nameable is nil
      "Unknown"
    end
  end
  