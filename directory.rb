@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the name of the student:"
  puts "To finish, just hit return"
  
  while true do
    name = gets.strip
    
    if name == ""
      break
    end

    while true do
      puts "Please enter which cohort this student is in:"
      puts "If unknown, just hit return"
      cohort = gets.strip
      
      if cohort == ""
        cohort = :Unknown
      else 
        cohort = cohort.to_sym
      end
      
      puts "Is this correct? Please enter yes or no."
      input = gets.strip

      if input.downcase == "no"
        next
      else
        break
      end
    
    end

    puts "Please enter their country of birth:"
    country = gets.strip

    if country == ""
      country = "Unknown"
    end

    puts "Please enter their height:"
    height = gets.strip

    if height == ""
      height = "Unknown"
    end

    puts "Please enter their hobbies:"
    hobbies = gets.strip

    if hobbies == ""
      hobbies = "Unknown"
    end

    @students << {name: name, 
      country: country, 
      height: height, 
      hobbies: hobbies, 
      cohort: cohort}
    
    if @students.count == 1
      puts ""
      puts "Now we have #{@students.count} student."
    else
      puts ""
      puts "Now we have #{@students.count} students."
    end

    puts ""
    puts "Please enter the name of the next student:"
    puts "To finish, just hit return"

  end
  
  @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
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

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students_list

  grouped_by_cohort = {}

  @students.each do |student|
    cohort = student[:cohort]
    name = student[:name]

    if grouped_by_cohort[cohort] == nil
      grouped_by_cohort[cohort] = [name]
    else
      grouped_by_cohort >> name
    end

  end

  grouped_by_cohort.each do |cohort, name|
    puts "#{cohort} cohort:".center(50)
    puts name
  end

end
  
#c = 0
  
#  while @students.length > c
#    puts "#{c + 1}. #{@students[c][:name]} (#{@students[c][:cohort]} cohort)".center(50)
#    puts "Country of birth: #{@students[c][:country]}".center(50)
#    puts "Height: #{@students[c][:height]}".center(50)
#    puts "Hobbies: #{@students[c][:hobbies]}".center(50)
#    puts ""

#    c += 1

#  end
#end

def print_footer
  if @students.count == 0
    puts "We have no students :(".center(50)
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student.".center(50)
  else
    puts "Overall, we have #{@students.count} great students.".center(50)
  end
end

interactive_menu