class Item < ApplicationRecord

  with_options presece: { message: '必須項目です'} do
    validates :name
    validates :explanation
    validates :categories_id
    validates :condition_id
    validates :fee_type_id
    validates :delvery_area_id
    validates :delivery_days_id
    validates :price, numericality: { only_integer: true, message: '半角数字で入力してください' }
      , inclusion { in: 300..9999999, message: '300~9999999円の範囲で入力してください' }
  end
end
