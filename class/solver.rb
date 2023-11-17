class Solver
  def factorial(number)
    (1..number).inject(:*) || 1
  end
end