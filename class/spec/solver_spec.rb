require_relative 'spec_helper'

describe Solver do
  it 'creates the factorial for a number' do
    solver = Solver.new
    result = solver.factorial(5)
    expect(result).to eq(120)
  end

  it 'creates a method to reverse a string' do
    solver = Solver.new
    result = solver.reverse('hello')
    expect(result).to eq('olleh')
  end

  describe '#fizzbuzz' do
    context 'when applying the FizzBuzz rules' do
      it 'returns "fizz" for multiples of 3' do
        expect(subject.fizzbuzz(6)).to eq('fizz')
      end

      it 'returns "buzz" for multiples of 5' do
        expect(subject.fizzbuzz(10)).to eq('buzz')
      end

      it 'returns "fizzbuzz" for multiples of both 3 and 5' do
        expect(subject.fizzbuzz(15)).to eq('fizzbuzz')
      end

      it 'returns the number as a string for other cases' do
        expect(subject.fizzbuzz(7)).to eq('7')
      end
    end
  end
end
