get '/people' do
  @people = Person.all
   erb :"/people/index"
end

get '/people/:id' do
  @person = Person.find(params[:id])
  @birth_date_number = Person.get_number(@person.birthdate.strftime("%m%d%Y"))
  @message = Person.my_message(@birth_date_number)
  erb :"/people/show"
end
