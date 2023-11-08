require_relative 'base_decorator'

class TrimDecorator < Decorator
  def correct_name
    temp_name = @nameable.correct_name[0..9]
    @nameable.correct_name.length >= 10 ? temp_name : @nameable.correct_name
  end
end
