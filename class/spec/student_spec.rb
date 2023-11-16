require_relative 'spec_helper'

describe Student do
  before :each do
    @student = Student.new('Unknown')
  end

  describe '#new' do
    context 'when creating a student instance' do
      it 'returns a student object' do
        expect(@student).to be_an_instance_of Student
      end

      it 'returns the students name' do
        expect(@student.name).to eql 'Unknown'
      end
    end
  end
end
