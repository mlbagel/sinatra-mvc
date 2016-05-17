get '/:birthdate' do
  setup_index_view
end

get '/' do
    @error = "Enter your Birthdate"
    erb :form
end

get '/message/:birth_date_number' do
  @birth_date_number = params[:birth_date_number].to_i
  @message = Person.my_message(@birth_date_number)
  erb :index
end

def setup_index_view
  birth_date = params[:birthdate]
  @birth_date_number = Person.get_number(birth_date)
  @message = Person.my_message(@birth_date_number)
  erb :index
end

post '/' do
birth_date = params[:birthdate].gsub("-", "")
   if Person.valid_birthdate(birth_date)
     @birth_date_number = Person.get_number(birth_date)
     redirect "/message/#{@birth_date_number}"
   else
     @error = "The birthdate you entered is incorrect. Please enter MMDDYYYY."
     erb :form
   end
 end


# post '/' do
#   birthdate = #params[:birthdate].gsub("-","")
#   @birth_date_number = #Person.get_number(birthdate)
#   redirect #"/message/#{@birth_date_number}"
# end

 #post '/' do
  # setup_index_view
# end
