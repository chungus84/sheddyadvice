if @feedback.persisted?
  json.form render(partial: "feedbacks/form", formats: :html, locals: {post: @post, feedback: Feedback.new})
  json.inserted_item render(partial: "feedbacks/feedback", formats: :html, locals: {feedback: @feedback, post: @post })
else
  json.form render(partial: "feedbacks/form", formats: :html, locals: { post: @post, feedback: @feedback })
end
