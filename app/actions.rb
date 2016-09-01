# Homepage (Root path)
get '/' do
  erb :splash
end

get '/ask' do
  @categories = Category.all

  erb :ask
end

post '/ask' do

  category = Category.find_by(title: params[:category])

  responses_in_category = Response.where(category_id: category.id)
  # number_of_responses_in_category = (responses_in_category.length)
  # random_number = rand(number_of_responses_in_category)

  # puts "================== #{random_number}"
  puts "================== #{responses_in_category.inspect}"

  @found_response = responses_in_category.first

  puts "================== #{@found_response.inspect}"

  erb :answer
end

get '/donate' do
  @categories = Category.all

  erb :donate
end

post '/donate' do
  new_response = Response.new

  new_response.content = params[:text]
  new_response.photo_url = params[:photo_url]
  new_response.category_id = Category.find_by(title: params[:category]).id

  if new_response.save
    redirect to('/')
  else
    erb :donate
  end
end
