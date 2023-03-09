# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table(:projects) do |t|
      t.string(:title)
      t.string(:description)
      t.integer(:status, default: 0)

      t.timestamps
    end
  end
end
