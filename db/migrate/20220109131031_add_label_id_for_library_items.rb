# frozen_string_literal: true

class AddLabelIdForLibraryItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :label, index: true
    add_reference :songs, :label, index: true
    add_reference :combos, :label, index: true
  end
end
