require 'rails_helper'

RSpec.describe Category, type: :model do
  
  describe 'Validations' do

    context 'when all required fields are given' do
      it 'should save the category successfully' do
      @category = Category.new(name: 'Test Category')
      @category.save!

      expect(@category.id).to be_present
      expect(@category.errors.count).to eq(0)
      expect(@category.name).to eq('Test Category')
      end
    end

    context 'when name field is missing' do
      it 'should not save the category and return an appropriate error' do
        @category = Category.new
      @category.save

      expect(@category.id).not_to be_present
      expect(@category.errors.full_messages).to include("Name can't be blank")
      end
    end
  end

end
