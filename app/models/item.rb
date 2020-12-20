class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :fee_type
  has_one_attached :image
  belongs_to :user

  with_options presence: { message: '必須項目です'} do
    validates :name
    validates :explaination
    validates :category_id
    validates :condition_id
    validates :fee_type_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :price, numericality: { only_integer: true, message: '半角数字で入力してください' }, inclusion: { in: 300..9999999, message: '300~9999999円の範囲で入力してください' }
  end

  with_options numericality: {other_than: 1, message: '選択されていません'} do
    validates :category_id
    validates :condition_id
    validates :fee_type_id
    validates :delivery_area_id
    validates :delivery_day_id
  end



end
