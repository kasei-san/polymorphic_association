class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :profilable, polymorphic: true, index: true
      t.string :disription

      t.timestamps null: false
    end
  end
end
