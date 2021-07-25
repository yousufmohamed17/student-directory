# create an empty array
@students = []

def input_students
  # get the first name
  puts "Please enter a student's name."
  puts "To finish, just leave blank and hit return."
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # get the cohort
    puts "What is their cohort? Leave blank if you don't know."
    cohort = gets.chomp
    # check for typos
    loop do
      puts "Are you happy with your input #{name} (cohort: #{cohort})? Please enter yes or no."
      response = gets.chomp.downcase
      if response == "yes"
        break
      elsif response == "no"
        input_students
      else
      end
    end
    # set default cohort
    cohort = "July" if cohort.empty?
    # add the student hash to the array
    @students << {name: name.capitalize, cohort: cohort.capitalize}
    puts "Now we have #{@students.count} student#{"s" if @students.size !=1}."
    # get another name from the user
    puts "What is the next student's name?"
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list
  @students.sort_by { |student| student[:cohort] }.each_with_index do 
  |student, i| puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  .center(50)
  end
end

def print_footer
  puts "-------------".center(50)
  puts "Overall, we have #{@students.count} great students"
  .center(50)
end

def print_menu
  puts "What would you like to do?"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  if @students.empty?
    puts "No students were entered." 
    return
  end
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu