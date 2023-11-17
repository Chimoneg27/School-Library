require_relative 'spec_helper'

describe Classroom do
  let(:classroom) { Classroom.new('A101') }
  let(:student) { instance_double('Student', classroom: nil) }

  context 'Initialization' do
    it 'should be an instance of Classroom' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'should have a label' do
      expect(classroom.label).to eq('A101')
    end

    it 'should have an empty list of students initially' do
      expect(classroom.students).to be_empty
    end
  end

  context 'Adding Students' do
    it 'should add a student to the classroom' do
      allow(student).to receive(:classroom=)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'should set the classroom for the added student' do
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
    end
  end
end
