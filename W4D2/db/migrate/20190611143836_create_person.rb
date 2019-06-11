class CreatePerson < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
    end

    # self.create_table(:people) do |t|
    #   t.string :namne, null: false
    # end
  end
end
