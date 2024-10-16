class AddDescriptionToInstruments < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:instruments, :description)
      add_column :instruments, :description, :text
    end
  end
end
