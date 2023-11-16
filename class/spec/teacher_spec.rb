require_relative 'spec_helper'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 30, name: 'John Doe', parent_permission: true) }

  context 'Initialization' do
    it 'should be an instance of Teacher' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'should have a specialization' do
      expect(teacher.specialization).to eq('Math')
    end

    it 'should have an age' do
      expect(teacher.age).to eq(30)
    end

    it 'should have a default name' do
      expect(teacher.name).to eq('John Doe')
    end

    it 'should have parent permission by default' do
      expect(teacher.parent_permission).to be true
    end
  end

  context 'Services' do
    it 'should be able to use services' do
      expect(teacher.can_use_services?).to be true
    end
  end
end
