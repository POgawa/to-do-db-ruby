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
