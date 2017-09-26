class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table(:answers) do |t|
      t.column(:survey_id, :integer)
      t.column(:response, :string)
      t.column(:question_id, :integer)

      t.timestamp()
    end
  end
end
