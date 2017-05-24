class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token, null: false
      t.boolean :active,      null:false, default: true
      t.references :tenant, index: true

      t.timestamps null: false
    end
    add_foreign_key :api_keys, :tenants
  end
end
