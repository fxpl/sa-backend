defmodule Cadet.Repo.Migrations.CreateAnswerStatistics do
  use Ecto.Migration

  def change do
    create table(:answer_statistics) do
      add(:answer, :integer, null: false)
      add(:question_id, references(:questions), null: false)
      add(:assessment_id, references(:assessments), null: false)
      add(:user_id, :integer)

      timestamps()
    end
  end
end
