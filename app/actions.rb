# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

get '/message/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end

get '/messages/:author' do
  @messages = Message.where(author: params[:author])
  erb :'messages/show_author'
end

post '/messages' do
  @message = Message.new(
    content: params[:content],
    author:  params[:author],
    url: params[:url]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end