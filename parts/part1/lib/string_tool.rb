module StringTool
   COLORS= {
      red: 31,
      green: 32,
      yellow: 33,
      error: 31,
      info: 32,
      warning: 33
   }
   %w(red green yellow error info warning).each do |color|
      define_method color do
      "\e[#{COLORS[color.to_sym]}m#{self}\e[0m"
      end
   end
   def to_second
      numbers = self.split(':')
      second = 0
      numbers.reverse.each_with_index do |number,index|
         second += number.to_i * (60 ** index)
      end
      second
   end
end
module PrettyTime
   def pretty_duration
      parse_string =
         if self < 3600
            '%M:%S'
         else
            '%H:%M:%S'
         end
      Time.at(self).utc.strftime(parse_string)
   end
end
class String
  include StringTool
end
class Integer
   include PrettyTime
end