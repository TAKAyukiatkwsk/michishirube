Michishirube::App.controllers :features do
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  layout 'apprication.html'

  get :index do
    @features = Feature.all.order_by(:created_at.asc)
    render 'features/index'
  end

  get :new do
    @feature = Feature.new
    render 'features/new'
  end

  post :create, map: "/features" do
    @feature = Feature.new(name: params[:feature][:name])
    if @feature.save
      redirect url(:features, :index)
    else
      render 'features/new'
    end
  end

  get :edit, map: "features/:id" do
    @feature = Feature.find(params[:id])
    render 'features/edit'
  end

  post :update, map: "features/:id" do
    feature = Feature.find(params[:id])
    feature.name = params[:feature][:name]
    feature.set_deadline(params[:feature][:deadline_year],
                         params[:feature][:deadline_month],
                         params[:feature][:deadline_day])
    feature.save

    redirect url(:features, :index)
  end

end
