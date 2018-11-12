class Course
    attr_accessor :course_name, :date_begin, :date_end
    def initialize(course_name,date_begin,date_end)
        @course_name = course_name
        @date_begin = date_begin
        @date_end = date_end
    end
    
    def self.courses(file)
        data = []
        File.readlines(file).each do |line|
        newdata = line.split(', ').map(&:chomp)
        course_name, date_begin, date_end = newdata.shift,newdata.shift,newdata.shift
        data << Course.new(course_name,date_begin,date_end)
        end
=begin
        data.each do |valor|
            puts "#{valor.course_name}, #{valor.date_begin}, #{valor.date_end}"
         end
=end
        return data
    end 

end

Course.courses('cursos.txt')