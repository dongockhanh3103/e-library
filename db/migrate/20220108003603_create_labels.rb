# frozen_string_literal: true

class CreateLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :labels do |t|
      t.string :name, limit: 100, default: ''
      t.text :description, limit: 255, default: ''

      t.timestamps
    end
  end
end
