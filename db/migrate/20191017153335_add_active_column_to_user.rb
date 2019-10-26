# frozen_string_literal: true

class AddActiveColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :active, :boolean, default: true
  end
end
