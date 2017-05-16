require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new
      @user.name = 'ahmed'
      @user.email = 'adel_ahmed90@yahoo.com'
      @user.password = '123456'
      @user.password_confirmation = '123456'
    end

    it ("check if user is created") do
      expect(@user).to be_valid
    end

    it ("check name is presence") do
      @user.name = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include ("Name can't be blank")
    end


    it ("check email is presence") do
      @user.email = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it ("check password is presence") do
      @user.password = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end

    it ("check password is presence") do
      @user.password_confirmation = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include ("Password confirmation can't be blank")
    end


    it("check if password == password_confirmation") do 
      @user.password ='123412' 
      @user.password_confirmation = '313211'
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it (" when email address is already taken") do
      @user.save
      duplicate = @user.dup
      expect(duplicate.valid?).to be false
      expect(duplicate.errors.full_messages).to include ("Email has already been taken")
    end
    
    it("check password length > 6") do
      @user.password = '12345'
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
    end
  end

  describe'.authenticate_with_credentials' do
    before (:each) do
      @user = User.new
      @user.name = 'ahmed'
      @user.email = 'adel_ahmed90@yahoo.com'
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.save
    end
    
    it("when there is spaces before the email") do
      user = User.authenticate_with_credentials('   adel_ahmed90@yahoo.com', '1234567')
      expect(user).to be_an_instance_of(User)
    end

    it("when there is uppercase chars") do
      user = User.authenticate_with_credentials('Adel_aHmed90@yahoo.com', '1234567')
      expect(user).to eq(@user)
    end
  end
  
end
