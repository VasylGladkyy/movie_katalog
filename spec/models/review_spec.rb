require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @rate = 10
    @description = 'Good movie!'
    @user = build(:user)
    @reviewable = build(:movie)
    @review = described_class.create(
      rate: @rate,
      description: @description,
      user: @user,
      reviewable: @reviewable
    )
  end

  it 'is valid with valid atributes' do
    expect(@review).to be_valid
  end

  describe 'not valid without invalid atributes' do
    it 'is not valid without a rate' do
      expect(described_class.create(
               rate: nil,
               description: @description,
               user: @user,
               reviewable: @reviewable
             )).not_to be_valid
    end

    it 'is not valid if rate bigger then 10 or smaller then 0' do
      expect(described_class.create(
               rate: 11,
               description: @description,
               user: @user,
               reviewable: @reviewable
             )).not_to be_valid

      expect(described_class.create(
               rate: -1,
               description: @description,
               user: @user,
               reviewable: @reviewable
             )).not_to be_valid
    end

    it 'is not valid without a description' do
      expect(described_class.create(
               rate: @rate,
               description: nil,
               user: @user,
               reviewable: @reviewable
             )).not_to be_valid
    end

    it 'is not valid without user' do
      expect(described_class.create(
               rate: @rate,
               description: nil,
               user: nil,
               reviewable: @reviewable
             )).not_to be_valid
    end

    it 'is not valid reviewable movie' do
      expect(described_class.create(
               rate: @rate,
               description: nil,
               user: @user,
               reviewable: nil
             )).not_to be_valid
    end
  end

  describe 'associations tests' do
    it 'should have one user' do
      reflection = described_class.reflect_on_association(:user)
      expect(reflection.macro).to eq(:belongs_to)
    end

    it 'should have one movie' do
      reflection = described_class.reflect_on_association(:reviewable)
      expect(reflection.macro).to eq(:belongs_to)
    end
  end
end
