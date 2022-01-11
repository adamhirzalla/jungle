require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user_params = {
      first_name: 'John', 
      last_name: 'Doe', 
      email: 'johndoe@example.com', 
      password: 'password', 
      password_confirmation: 'password'
    }
  end

  describe 'Validations' do

    context 'when all required fields are given' do
      it 'should register the user successfully' do
        @user = User.new(@user_params)
        @user.save!

        expect(@user.id).to be_present
        expect(@user.errors.count).to eq(0)
        expect(@user.email).to eq('johndoe@example.com')
      end
    end

    context 'when password confirmation field is missing' do
      it 'should not register the user and return an appropriate error' do
        @user_params[:password_confirmation] = nil
        @user = User.new(@user_params)
        @user.save
        
        expect(@user.id).not_to be_present
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end
  
    context "when passwords don't match (case-sesntive)" do
      it 'should not register the user and return an appropriate error' do
        @user_params[:password_confirmation] = 'PASSWORD'
        @user = User.new(@user_params)
        @user.save
        
        expect(@user.id).not_to be_present
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  
    context "when user registers with an existing email (case-insensitive)" do
      it 'should not register the user and return an appropriate error' do
        @user = User.new(@user_params)
        @user.save!
        
        # Compared to johndoe@example.com
        @user_params[:email].upcase!
        @duplicate = User.new(@user_params)
        @duplicate.save
        
        expect(@duplicate.id).not_to be_present
        expect(@duplicate.errors.full_messages).to include("Email has already been taken")
      end
    end
  
    context "when email field is missing" do
      it 'should not register the user and return an appropriate error' do
        @user_params[:email] = nil
        @user = User.new(@user_params)
        @user.save
        
        expect(@user.id).not_to be_present
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end
  
    context "when first name field is missing" do
      it 'should not register the user and return an appropriate error' do
        @user_params[:first_name] = nil
        @user = User.new(@user_params)
        @user.save
        
        expect(@user.id).not_to be_present
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end
  
    context "when last name field is missing" do
      it 'should not register the user and return an appropriate error' do
        @user_params[:last_name] = nil
        @user = User.new(@user_params)
        @user.save
        
        expect(@user.id).not_to be_present
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    context "when password is less than 5 characters" do
      it 'should not register the user and return an appropriate error' do
        @user_params[:password] = 'pass'
        @user_params[:password_confirmation] = 'pass'
        @user = User.new(@user_params)
        @user.save
        
        expect(@user.id).not_to be_present
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
      end
    end
  end

  describe '.authenticate_with_credentials' do
    context 'when a user logs in with valid credentials' do
      it 'Logs the user in' do
        User.create!(@user_params)

        @user = User.authenticate_with_credentials(
          @user_params[:email], 
          @user_params[:password]
        )
        
        expect(@user).not_to be nil
        expect(@user.id).to be_present
        expect(@user.errors.count).to eq(0)
        expect(@user.email).to eq('johndoe@example.com')
      end
    end

    context 'when an email is in different case' do
      it 'Logs the user in' do
        User.create!(@user_params)

        @user = User.authenticate_with_credentials(
          @user_params[:email].upcase, 
          @user_params[:password]
        )
        
        expect(@user).not_to be nil
        expect(@user.id).to be_present
        expect(@user.errors.count).to eq(0)
        expect(@user.email).to eq('johndoe@example.com')
      end
    end

    context 'when a user logs in with invalid credentials' do
      it 'returns an appropriate error message' do
        User.create!(@user_params)

        @user = User.authenticate_with_credentials(
          @user_params[:email], 
          @user_params[:password].upcase
        )
        
        expect(@user).to be nil
      end
    end

    context 'when a user logs in with spaces in email' do
      it 'Logs the user in' do
        User.create!(@user_params)

        @user = User.authenticate_with_credentials(
          '   ' + @user_params[:email] + '  ', 
          @user_params[:password]
        )
        
        expect(@user).not_to be nil
        expect(@user.id).to be_present
        expect(@user.errors.count).to eq(0)
        expect(@user.email).to eq('johndoe@example.com')
      end
    end
  end
end
