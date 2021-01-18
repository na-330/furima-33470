require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmation,が存在すれば登録できること" do
      expect(@user).to be_valid
    end
  end
end