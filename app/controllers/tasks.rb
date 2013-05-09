Michishirube::App.controllers :tasks do
  post :create, map: "/tasks" do
    begin
      feature = Feature.find(params[:feature_id])
      task = Task.new(name: params[:task][:name], status: :todo, point: params[:task][:point])
      if task.valid?
        feature.tasks << task
      end
      redirect url(:features, :show, id: feature.id)
    rescue => e
      404
    end
  end
end

