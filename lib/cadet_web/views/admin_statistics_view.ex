defmodule CadetWeb.AdminStatisticsView do
  use CadetWeb, :view

  def render("index.json", %{stats: stats}) do
    %{stats: render_many(stats, __MODULE__, "stat.json", as: :stat)}
  end

  def render("stat.json", %{stat: stat}) do
    %{
      assessment_id: stat.assessment_id,
      question_id: stat.question_id,
      answer: stat.answer,
      course_registration_id: stat.course_registration_id,
      attempt_number: stat.attempt_number
    }
  end
end
