require ("sinatra")
require ('sinatra/reloader')
require('./lib/task.rb')
require('./lib/list.rb')
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "to_do"})



get('/') do
   erb(:index)
 end

 get('/lists') do
   @lists = List.all
   erb(:lists)
 end

 get('/lists/new') do
   erb(:list_form)
 end

 post('/lists') do
   name = params.fetch("name")
   list = List.new({:name => name, :id => nil})
   list.save()
   erb(:list_success)
 end

get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list)
end



get'/tasks/:id' do
  @list = params.fetch("id").to_i
  erb(:add_task)
end

post("/tasks/:id") do
  description = params.fetch("description")
  list_id = params.fetch("id").to_i()
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id})
  @task.save()
  erb(:task_success)
end
