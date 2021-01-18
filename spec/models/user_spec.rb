require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it '重複したemailが存在した場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれてなければ登録できない' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'ys1111'
      @user.password_confirmation = 'ys1111'
      expect(@user).to be_valid
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'ys111'
      @user.password_confirmation = 'ys111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合でなければ登録できない' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
    end
    it 'last_name_jがない場合は登録できないこと' do
      @user.last_name_j = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name j is invalid')
    end
    it 'last_name_kがない場合は登録できないこと' do
      @user.last_name_k = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name k is invalid')
    end
    it 'first_name_jがない場合は登録できないこと' do
      @user.first_name_j = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name j is invalid')
    end
    it 'first_name_kanaがない場合は登録できないこと' do
      @user.first_name_k = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name k is invalid')
    end
    it 'first_name_kが全角入力でなければ登録できないこと' do
      @user.first_name_k = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name k is invalid')
    end
    it 'last_nameが全角入力でなければ登録できないこと' do
      @user.last_name_k = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name k is invalid')
    end
    it 'first_name_kが全角カタカナでなければ登録できないこと' do
      @user.first_name_k = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name k is invalid')
    end
    it 'last_name_kが全角カタカナでなければ登録できないこと' do
      @user.last_name_k = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name k is invalid')
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
