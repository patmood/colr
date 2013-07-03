helpers do
  def current_user
    !session[:user_id].nil?
  end
end

# before do
#   pass if request.path_info =~ /^\/auth\//
#   redirect to('/auth/twitter') unless current_user
# end

get '/' do

  erb :index
end

get '/auth/twitter/callback' do
  @user = User.parse_twitter(env['omniauth.auth'])
  session[:user_id] = @user.id
  redirect "/c/#{@user.nickname}"
end

get '/c/:nickname' do
  @user = User.find(session[:user_id])
  if @user.nickname != params[:nickname]
    erb :guest
  else
    erb :owner
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end



# get '/:nickname/:id'
#   @user = User.find(session[:user])
#   @user.nack
# end

get 'auth/failure' do

end
