post '/photo/create' do
  Photo.create(params[:photo])
  user = User.find(params[:photo][:user_id])
  redirect "c/#{user.nickname}"
end
