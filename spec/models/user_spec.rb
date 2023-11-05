require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:recipes) }
    it { is_expected.to have_many(:foods) }
  end

  describe 'Devise validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to allow_value('email@example.com').for(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
end
