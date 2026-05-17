# kand-statistics

defmodule Cadet.Statistics do
  import Ecto.Query

  alias Cadet.Repo
  alias Cadet.Statistics.AnswerStatistic

  @doc """
  Returns all answer statistics for a given assessment in a course.
  """
  def list_stats(assessment_id) do
    AnswerStatistic
    |> where([s], s.assessment_id == ^assessment_id)
    |> Repo.all()
  end


@doc """
Returns all answer statistics that matches a certain assessment and question id
"""
  def get_stat_from_question(assessment_id, question_id) do
    AnswerStatistic
    |> where([s], s.assessment_id == ^assessment_id and s.question_id == ^question_id)
    |> Repo.all()
  end

  @doc """
  updates an answer statistic. If a record already exists for the given
  (course_registration_id, question_id) pair, increments attempt_number and
  updates the answer. Otherwise inserts a new record.
  """
  def update_stat(attrs) do
    existing = Repo.get_by(AnswerStatistic,
      course_registration_id: attrs.course_registration_id,
      question_id: attrs.question_id
    )

    case existing do
      nil ->
        %AnswerStatistic{}
        |> AnswerStatistic.changeset(attrs)
        |> Repo.insert()

      stat ->
        stat
        |> AnswerStatistic.changeset(%{
            answer: attrs.answer,
            attempt_number: stat.attempt_number + 1
          })
        |> Repo.update()
    end
  end
end
