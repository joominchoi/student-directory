def input_students
  students = []
  
  puts "Please enter the name of the student:"
  puts "To finish, just hit return"
  
  while true do
    
    name = gets.chomp
    
    if name == ""
      break
    end

    puts "Please enter their country of birth:"
    country = gets.chomp

    if country == ""
      country = "Unknown"
    end

    puts "Please enter their height:"
    height = gets.chomp

    if height == ""
      height = "Unknown"
    end

    puts "Please enter their hobbies:"
    hobbies = gets.chomp

    if hobbies == ""
      hobbies = "Unknown"
    end

    students << {name: name, 
      country: country, 
      height: height, 
      hobbies: hobbies, 
      cohort: :november}
    
    if students.count == 1
      puts ""
      puts "Now we have #{students.count} student."
    else
      puts ""
      puts "Now we have #{students.count} students."
    end

    puts ""
    puts "Please enter the name of the next student:"
    puts "To finish, just hit return"

  end
  
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  c = 0
  
  while students.length > c
    puts "#{c + 1}. #{students[c][:name]} (#{students[c][:cohort]} cohort)"
    puts "Country of birth: #{students[c][:country]}"
    puts "Height: #{students[c][:height]}"
    puts "Hobbies: #{students[c][:hobbies]}"
    puts ""

    c += 1

  end
end

def print_footer(names)
  if names.count == 0
    puts "We have no students :("
  elsif names.count == 1
    puts "Overall, we have #{names.count} great student."
  else
    puts "Overall, we have #{names.count} great students."
  end
end

students = input_students
print_header
print(students)
print_footer(students)