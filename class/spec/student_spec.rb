require_relative 'spec_helper'

describe Student do
  before :each do
    @classroom = Classroom.new('Math')
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

  describe '#classroom=' do
    let(:new_classroom) { double('Classroom', students: []) }

    it 'sets the classroom of the student' do
      @student.classroom = new_classroom
      expect(@student.classroom).to eq(new_classroom)
    end
  end

  describe '#play_hooky' do
    before :each do
      @classroom = Classroom.new('Math')
      @student = Student.new('Unknown')
    end

    it 'removes the student from the classroom' do
      @student.play_hooky
      expect(@classroom.students).not_to include(@student)
    end
  end
end
