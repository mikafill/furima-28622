class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string   :name,              null: false
      t.text      :explanation,      null: false
      t.integer   :categories_id,    null: false
      t.integer   :condition_id,     null: false
      t.integer   :fee_type_id,      null: false
      t.integer   :delivery_area_id, null: false
      t.integer   :deluvery_days_id, null: false
      t.integer   :price,            null: false
      t.reference :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
