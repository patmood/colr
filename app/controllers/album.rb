post '/album/create' do
  @album = Album.create(:title => params[:title])
  @album.users << User.find(params[:user_id])
  puts "\033[32m [PARAMS] #{params.inspect} \n [NICKNAME] #{params[:nickname]} \033[0m"
  redirect "/c/#{params[:nickname]}"
end
