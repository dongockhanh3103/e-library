# frozen_string_literal: true

class CreateItemsLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :items_labels do |t|
      t.bigint :source_id, null: false
      t.references :label
      t.string :type

      t.timestamps
    end
  end
end
