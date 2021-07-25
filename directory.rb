def input_students
  # create an empty array
  students = []
  
  # get the first name
  puts "Please enter the first student's name."
  puts "To finish, just leave blank and hit return."
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # get the cohort
    puts "What is their cohort? Leave blank if you don't know."
    cohort = gets.chomp
    cohort = "July" if cohort.empty?
    # add the student hash to the array
    students << {name: name.capitalize, cohort: cohort.capitalize}
    output = "Now we have #{students.count} student"
    students.count > 1 ? output.concat("s.") : output.concat(".")
    puts output
    # get another name from the user
    puts "What is the next student's name?"
    name = gets.chomp
  end

  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students.sort_by { |student| student[:cohort] }.each_with_index do 
  |student, i| puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  .center(50)
  end
end

def print_footer(students)
  puts "-------------".center(50)
  puts "Overall, we have #{students.count} great students"
  .center(50)
end

def interactive_menu
  students = []
  loop do
    # print the menu and ask the user what to do
    puts "What would you like to do?"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # read the input and save it into a variable
    selection = gets.chomp
    # do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      if students.empty?
        puts "No students were entered." 
        next 
      end
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu