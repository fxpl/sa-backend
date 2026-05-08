defmodule Cadet.Statistics.AnswerStatistic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answer_statistics" do
    field(:answer, :integer)
    field(:attempt_number, :integer, default: 1)

    belongs_to(:question, Cadet.Assessments.Question)
    belongs_to(:assessment, Cadet.Assessments.Assessment)
    belongs_to(:course_registration, Cadet.Accounts.CourseRegistration)

    timestamps()
  end

  def changeset(stat, attrs) do
    stat
    |> cast(attrs, [
      :answer,
      :attempt_number,
      :question_id,
      :assessment_id,
      :course_registration_id
    ])
    |> validate_required([:answer, :question_id, :assessment_id, :course_registration_id])
    |> validate_number(:attempt_number, greater_than: 0)
  end
end
