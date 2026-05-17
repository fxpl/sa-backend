defmodule CadetWeb.AdminStatisticsView do
  use CadetWeb, :view

  def render("index.json", %{stats: stats}) do
    %{stats: render_many(stats, __MODULE__, "stat.json", as: :stat)}
  end

  def render("stat.json", %{stat: stat}) do
    %{
      assessmentId: stat.assessment_id,
      questionId: stat.question_id,
      answer: stat.answer,
      courseRegistrationId: stat.course_registration_id,
      attemptNumber: stat.attempt_number
    }
  end
end
