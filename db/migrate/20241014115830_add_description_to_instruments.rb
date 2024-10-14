class AddDescriptionToInstruments < ActiveRecord::Migration[7.1]
  def change
    add_column :instruments, :description, :text
  end
end
