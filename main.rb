require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "Hello!"
end

get '/hello_world' do
  "Hello, World!"
end

get '/hello_me' do
  @me = "David"
  return "Hello, #{@me}"
end

get '/hello_you/:name' do
  @name = params[:name]
  return "Hello, #{@name}"
end

# localhost:4567/names/david/fisher
get '/names/:first/:last' do
  @first = params[:first]
  @last = params[:last]
  return "You can do multiple parameters,
          #{@first.capitalize}, #{@last.capitalize}!"
end

# Sums two numbers from the URL
# localhost:4567/calc/add/1/2
get '/calc/add/:first/:second' do
  #passes in params as strings. Must change to integer
  @first = params[:first].to_i
  @second = params[:second].to_i
  #It wants a string to output it again
  return (@first + @second).to_s
end

#Returns the product of two numbers
# localhost:4567/calc/multiply/5/10
get '/calc/multiply/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first * @second).to_s
end

get '/oh_hai/:name' do
  @answer_to_universe = 42
  @name = params[:name]
  erb :hai
end

# localhost:4567/calc/1/sum/3
get '/calc/:first/:operation/:second' do
  @first = params[:first].to_f
  #Valid operations: sum, difference, product, quotient
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
    when "sum" then @first + @second
    when "difference" then @first - @second
    when "product" then @first * @second
    when "quotient" then @first / @second
  end
  erb :calc
end

# localhost:4567/calc_form
get '/calc_form' do
  @first = params[:first].to_f
  #Valid operations: sum, difference, product, quotient
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
    when "sum" then @first + @second
    when "difference" then @first - @second
    when "product" then @first * @second
    when "quotient" then @first / @second
  end
  erb :calc_form
end

get '/my_array' do
  @my_array = ["Red", "Blue", "Green"]
  erb :array
end