def input_students
  students = []
  
  puts "Please enter the name of the student:"
  puts "To finish, just hit return"
  
  while true do
    
    name = gets.chomp
    
    if name == ""
      break
    end

    while true do
      puts "Please enter which cohort this student is in:"
      puts "If unknown, just hit return"
      cohort = gets.chomp
      
      if cohort == ""
        cohort = :Unknown
      else 
        cohort = cohort.to_sym
      end
      
      puts "Is this correct? Please enter yes or no."
      input = gets.chomp

      if input.downcase == "no"
        next
      else
        break
      end
    
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
      cohort: cohort}
    
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
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  c = 0
  
  while students.length > c
    puts "#{c + 1}. #{students[c][:name]} (#{students[c][:cohort]} cohort)".center(50)
    puts "Country of birth: #{students[c][:country]}".center(50)
    puts "Height: #{students[c][:height]}".center(50)
    puts "Hobbies: #{students[c][:hobbies]}".center(50)
    puts ""

    c += 1

  end
end

def print_footer(names)
  if names.count == 0
    puts "We have no students :(".center(50)
  elsif names.count == 1
    puts "Overall, we have #{names.count} great student.".center(50)
  else
    puts "Overall, we have #{names.count} great students.".center(50)
  end
end

students = input_students
print_header
print(students)
print_footer(students)