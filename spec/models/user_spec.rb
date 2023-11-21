require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save successfully when all fields are set' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user.save!
      expect(@user).to be_present
    end

    it 'should not save when first name is not set' do
      @user = User.new(firstName: nil, surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user.save
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'should not save when last name is not set' do
      @user = User.new(firstName: 'Test', surname: nil, email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user.save
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end

    it 'should not save when email is not set' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: nil, password: 'testing', password_confirmation: 'testing')
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not save when password is not set' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: nil, password_confirmation: 'testing')
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not save when password confirmation is not set' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should not save when password and password confirmation do not match' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'test1')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not save when email is not unique' do
      @user1 = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user1.save
      @user2 = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.COM', password: 'testing', password_confirmation: 'testing')
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not save when password is less than 6 characters' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return the user when the credentials are valid' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user.save!
      expect(User.authenticate_with_credentials('test@test.com', 'testing')).to eq(@user)
    end

    it 'should return nil when the email is invalid' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user.save!
      expect(User.authenticate_with_credentials('test@test.com', 'test')).to eq(nil)
    end

    it 'should return nil when the password is invalid' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user.save!
      expect(User.authenticate_with_credentials('test@test.com', 'test')).to eq(nil)
    end

    it 'should return the user when the email has leading or trailing spaces' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user.save!
      expect(User.authenticate_with_credentials('test@test.com ', 'testing')).to eq(@user)
    end

    it 'should return the user when the email has different cases' do
      @user = User.new(firstName: 'Test', surname: 'Test', email: 'test@test.com', password: 'testing', password_confirmation: 'testing')
      @user.save!
      expect(User.authenticate_with_credentials('TEST@test.com', 'testing')).to eq(@user)
    end
  end

end