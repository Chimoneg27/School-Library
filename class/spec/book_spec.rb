require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new 'title', 'author'
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end

    it 'throws an ArgumentError when given fewer than 2 parameters' do
      -> { Book.new 'title' }.should raise_exception ArgumentError
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'title'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      @book.author.should eql 'author'
    end
  end
end
