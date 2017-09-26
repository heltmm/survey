class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |t|
      t.column(:survey_id, :integer)
      t.column(:ask, :string)

      t.timestamp()
    end
  end
end
