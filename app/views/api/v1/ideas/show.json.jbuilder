json.extract! @idea, :id, :title, :description, :team_name

json.images do |image_json|
  image_json.array!(@idea.images) do |image|
    image_json.extract! image, :image_url
  end
end
