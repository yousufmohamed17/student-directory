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
    students << {name: name, cohort: cohort.capitalize}
    puts "Now we have #{students.count} students."
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
  puts "Overall, we have #{students.count} great students"
  .center(50)
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)