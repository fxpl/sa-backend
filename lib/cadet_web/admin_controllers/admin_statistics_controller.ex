defmodule CadetWeb.AdminStatisticsController do
  use CadetWeb, :controller

  alias Cadet.Statistics

  @doc """
  GET /v2/courses/:course_id/admin/statistics?assessment_id=X
  Returns all answer statistics for a given assessment. Staff only.
  """
  def index(conn, %{"assessment_id" => assessment_id}) do
    course_id = conn.assigns.course_reg.course_id
    stats = Statistics.list_stats(course_id, assessment_id)
    render(conn, "index.json", stats: stats)
  end
end
