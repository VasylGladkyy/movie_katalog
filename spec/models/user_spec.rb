require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @email = 'default.email@gmail.com'
    @password = 'password'
    @nickname = 'TomHardy'
    @user = described_class.create(
      nickname: @nickname,
      email: @email,
      password: @password
    )
  end

  it 'is valid with valid atributes' do
    expect(@user).to be_valid
  end

  describe 'not valid without invalid atributes' do
    context 'if user nickname is have invalid atributes' do
      it 'if user nickname is null' do
        expect(described_class.create(
                 nickname: nil,
                 email: Faker::Internet.safe_email,
                 password: @password
               )).not_to be_valid
      end

      it 'if user nickname is incorect' do
        incorect_name_one = 'asdasd adasd asdasd'
        incorect_name_two = 'asdsad%^&!@#E)'
        expect(described_class.create(
                 nickname: incorect_name_one,
                 email: Faker::Internet.safe_email,
                 password: @password
               )).not_to be_valid

        expect(described_class.create(
                 nickname: incorect_name_two,
                 email: Faker::Internet.safe_email,
                 password: @password
               )).not_to be_valid
      end

      it 'if user nickname is not unique' do
        expect(described_class.create(
                 nickname: @user,
                 email: Faker::Internet.safe_email,
                 password: @password
               )).not_to be_valid
      end
    end

    context 'if user email is have invalid atributes' do
      it 'if user email is nil' do
        expect(described_class.create(
                 nickname: Faker::Name.first_name,
                 email: nil,
                 password: @password
               )).not_to be_valid
      end

      it 'if user email is have invalid value' do
        expect(described_class.create(
                 nickname: Faker::Name.first_name,
                 email: 'asdasdasdasd',
                 password: @password
               )).not_to be_valid
      end

      it 'if user email is have not unique' do
        expect(described_class.create(
                 nickname: Faker::Name.first_name,
                 email: @email,
                 password: @password
               )).not_to be_valid
      end
    end

    context 'if user password is have invalid atributes' do
      it 'if user password is nil' do
        expect(described_class.create(
                 nickname: Faker::Name.first_name,
                 email: Faker::Internet.safe_email,
                 password: nil
               )).not_to be_valid
      end

      it 'if user lenght less than 6 characters' do
        expect(described_class.create(
                 nickname: Faker::Name.first_name,
                 email: Faker::Internet.safe_email,
                 password: '12345'
               )).not_to be_valid
      end
    end
  end

  describe 'associations tests' do
    it 'should have many reviews' do
      reflection = described_class.reflect_on_association(:reviews)
      expect(reflection.macro).to eq(:has_many)
    end
  end
end
