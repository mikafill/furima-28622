class Item < ApplicationRecord

  with_options presece: { message: '必須項目です'} do
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :fee_type_id
    validates :delvery_area_id
    validates :delivery_day_id
    validates :price, numericality: { only_integer: true, message: '半角数字で入力してください' }
      , inclusion { in: 300..9999999, message: '300~9999999円の範囲で入力してください' }
  end

  with_options numericality: {other_than: 1, message: '選択されていません'} do
    validates :category_id
    validates :condition_id
    validates :fee_type_id
    validates :delvery_area_id
    validates :delivery_day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id, :condition_id, :fee_type_id, :delvery_area_id, :delivery_day_id, :price
end
