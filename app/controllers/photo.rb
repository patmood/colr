post '/photo/create' do
  photo = Photo.create(params[:photo])
  user = User.find(params[:photo][:user_id])
  redirect "/c/#{user.nickname}/album/#{photo.album.id}"
end
