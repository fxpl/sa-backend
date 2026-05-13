defmodule Cadet.Statistics.AnswerStatistic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answer_statistics" do
    field(:answer, :integer)
    field(:question_id, :integer)
    field(:assessment_id, :integer)
    field(:user_id, :integer)

    timestamps()
  end

  def changeset(stat, attrs) do
    stat
    |> cast(attrs, [
      :answer,
      :question_id,
      :assessment_id,
      :user_id
    ])
    |> validate_required([:answer, :question_id, :assessment_id])
  end
end
