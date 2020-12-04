require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいく時' do
      it 'nickname, email, password, birthday, first_name, last_name, kana_first_name, kana_last_nameがあれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上で登録できる' do
        @user.password = '1aaaaa'
        @user.password_confirmation = '1aaaaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname 必須項目です')
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Email 必須項目です')
      end

      it 'emailが@を含んでいないと登録できない' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email @を含む有効なメールアドレスを入力してください')
      end

      it '重複したemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email すでに使用されているアドレスです')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 必須項目です')
      end

      it 'passwordは5文字以下では登録できない' do
        @user.password = '1aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 6文字以上で入力してください')
      end

      it 'passwordが存在してもpassword_confirmationがないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは英語だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字で入力してください')
      end

      it 'passwordは数字だけでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字で入力してください')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Birthday 必須項目です')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 必須項目です')
      end

      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力してください')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 必須項目です')
      end

      it 'last_nameが全角でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力してください')
      end

      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name 必須項目です')
      end

      it 'kana_first_nameがカタカナでないと登録できない' do
        @user.kana_first_name = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name カタカナで入力してください')
      end

      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name 必須項目です')
      end

      it 'kana_last_nameがカタカナでないと登録できない' do
        @user.kana_last_name = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name カタカナで入力してください')
      end
    end
  end
end
