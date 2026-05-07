defmodule Cadet.Statistics do
  import Ecto.Query

  alias Cadet.Repo
  alias Cadet.Statistics.AnswerStatistic

  @doc """
  Returns all answer statistics for a given assessment in a course.
  """
  def list_stats(course_id, assessment_id) do
    AnswerStatistic
    |> join(:inner, [s], cr in assoc(s, :course_registration))
    |> where([s, cr], cr.course_id == ^course_id and s.assessment_id == ^assessment_id)
    |> Repo.all()
  end

  @doc """
  Inserts a single answer statistic record. Returns {:ok, stat} or {:error, changeset}.
  """
  def create_stat(attrs) do
    %AnswerStatistic{}
    |> AnswerStatistic.changeset(attrs)
    |> Repo.insert()
  end
end
