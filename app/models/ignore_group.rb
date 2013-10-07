class IgnoreGroup < ActiveRecord::Base
  
  # takes the words attribute and converts into regex
  def to_regex
    
    formatted_words = self.words # do some formatting.
    
    ignored_regex = '('
    formatted_words.split(',').each do |word|
      ignored_regex = ignored_regex + '\b' + word + '\b|'
    end
    ignored_regex = ignored_regex.chomp('|') + ')'
    reg = Regexp.new(ignored_regex, Regexp::IGNORECASE)

    return reg
    
  end
end
# == Schema Information
#
# Table name: ignore_groups
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  words      :text
#  created_at :datetime
#  updated_at :datetime
#

