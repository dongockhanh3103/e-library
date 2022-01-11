# frozen_string_literal: true

class CreateCombos < ActiveRecord::Migration[6.1]
  def change
    create_table :combos do |t|
      t.references :book
      t.references :song

      t.timestamps
    end
  end
end
