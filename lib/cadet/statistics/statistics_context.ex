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

  @spec create_stat(
          :invalid
          | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: any()
  @doc """
  Inserts a single answer statistic record. Returns {:ok, stat} or {:error, changeset}.
  """
  def create_stat(attrs) do
    %AnswerStatistic{}
    |> AnswerStatistic.changeset(attrs)
    |> Repo.insert()
  end
end
