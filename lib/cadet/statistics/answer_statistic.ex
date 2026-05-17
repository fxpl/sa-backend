defmodule Cadet.Statistics.AnswerStatistic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answer_statistics" do
    field(:answer, :integer)
    field(:question_id, :integer)
    field(:assessment_id, :integer)
    field(:course_registration_id, :integer)
    field(:attempt_number, :integer)

    timestamps()
  end

  def changeset(stat, attrs) do
    stat
    |> cast(attrs, [
      :answer,
      :question_id,
      :assessment_id,
      :course_registration_id,
      :attempt_number
    ])
    |> validate_required([:answer, :question_id, :assessment_id, :course_registration_id])
  end
end
