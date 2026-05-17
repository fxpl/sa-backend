defmodule CadetWeb.StatisticsController do
  use CadetWeb, :controller

  alias Cadet.Statistics

  @doc """
  POST /v2/courses/:course_id/statistics
  Called by the frontend when a student submits an answer.
  Saves one answer record to the answer_statistics table.
  """
  def create(conn, params) do
    course_reg_id = conn.assigns.course_reg.id

    attrs = %{
      answer: params["answer"],
      question_id: params["questionId"],
      assessment_id: params["assessmentId"],
      course_registration_id: course_reg_id,
      attempt_number: 1
    }

    case Statistics.update_stat(attrs) do
      {:ok, _stat} ->
        send_resp(conn, :created, "")

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: inspect(changeset.errors)})
    end
  end
end
