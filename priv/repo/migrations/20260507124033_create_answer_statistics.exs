defmodule Cadet.Repo.Migrations.CreateAnswerStatistics do
  use Ecto.Migration

  def change do
    create table(:answer_statistics) do
      add :answer,                 :integer, null: false
      add :attempt_number,         :integer, null: false, default: 1
      add :question_id,            references(:questions),            null: false
      add :assessment_id,          references(:assessments),          null: false
      add :course_registration_id, references(:course_registrations), null: false

      timestamps()
    end
  end
end
