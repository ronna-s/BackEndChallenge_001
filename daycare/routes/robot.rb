class Daycare < Sinatra::Base

  helpers RobotsHelper

  #index
  get '/robots' do
    index
  end

  #create
  post '/robots' do
    create
  end

  # important!!
  # the following routes assume name = "XX"+id

  #show
  get '/robots/:name' do #same as /robots/XX:id
    show
  end

  #history
  get '/robots/:name/history' do #same as /robots/XX:id/history
    history
  end

  #update
  put '/robots/:name' do #same as /robots/XX:id
    update
  end

  #update
  patch '/robots/:name' do #same as /robots/XX:id
    update
  end

  #destroy
  delete '/robots/:name' do #same as /robots/XX:id
    destroy
  end

  error ::IllegalName do
    halt 400, json(status: 'error', message: 'Robot name is illegal - must be XX<id>')
  end

  error ::InvalidJsonBody do
    halt 400, json(status: 'error', message: 'request body must be valid json')
  end

  error ActiveRecord::RecordNotFound do
    halt 404, json(status: 'error', message: 'record not found')
  end

end
