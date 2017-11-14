require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.new(
      :name => 'Seb',
      :email => "SEB@GMAIL.COM",
      :password_digest => "1234",
    )
  end

  context 'Validations' do
    it ': user should valid be with default settings' do
      @user.valid?
    end

    it ': email should be unique' do
      @user2 = User.new(
        :name => 'Seb',
        :email => "SEB@GMAIL.COM",
        :password => "1234",
        :password_confirmation => "1234"
      )
      @user.save!
      expect(@user2.save).to eq(false)
    end

    it ': name must be present' do
      @user.name = nil
      expect(@user.valid?).to eq(false)
    end

    it ': email must be present' do
      @user.email = nil
      expect(@user.valid?).to eq(false)
    end

    it ': password digest must be longer than 3 characters' do
      @user.password_digest = 'abc'
      byebug
      expect(@user.valid?).to eq(false)
    end
  end

  # describe '.authenticate' do
  #   it ": should be true when password and email is correct" do
  #     byebug
  #     expect(@user.authenticate(:password)).to eq(false)
  #   end
  # end
end


# create_table "users", force: :cascade do |t|
#   t.string   "name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end
