require_relative 'spec_helper'

describe Solver do
  it 'creates the factorial for a number' do
    solver = Solver.new
    result = solver.factorial(5)
    expect(result).to eq(120)
  end
end