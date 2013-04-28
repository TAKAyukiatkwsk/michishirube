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
  
  get :index do
    @features = Feature.all
    render 'features/index'
  end

  get :new do
    @feature = Feature.new
    render 'features/new'
  end

  post :create, map: "/features" do
    feature = Feature.new(name: params[:feature][:name])
    feature.save
    redirect url(:features, :index)
  end

end
