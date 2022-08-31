if @listpost.persisted?
  # json.form render(partial: "lists/posts", formats: :html, locals: {searched_posts: @searched_posts, list: @list, listpost: Listpost.new})
  json.inserted_item render(partial: "lists/added_posts", formats: :html, locals: {listpost: @listpost})
else
  # json.form render(partial: "lists/posts", formats: :html, locals: {searched_posts: @searched_posts, listpost: @listpost, list: @list })
end
