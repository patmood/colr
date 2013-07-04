post '/album/create' do
  @album = Album.create(:title => params[:title])
  @album.users << User.find(params[:user_id])
  puts "\033[32m [PARAMS] #{params.inspect} \n [NICKNAME] #{params[:nickname]} \033[0m"
  redirect "/c/#{params[:nickname]}"
end

post '/album' do
  @user = User.find(session[:user_id])
  @album = Album.find(params[:album_id])
  erb :_photo_list, :layout => false
end

get '/c/:nickname/album/:album_id' do
  @user = User.find(session[:user_id])
  @album = Album.find(params[:album_id])
  if @album.users.map(&:id).include? session[:user_id]
    erb :owner
  else
    erb :guest
  end
end

# '/album/:album_id', 
