class Document < ActiveRecord::Base
  
  def count_words(case_sensitive, ignored_regex_array=[])
    
    formatted_content = self.content # prepare formatted_content
    
   
    word_hash = Hash.new(0) # new hash to store
    formatted_content = formatted_content.gsub(/[\,\.\"\!\?\@\#\$\%\/\&\(\)]/i,' ')
   

    ignored_regex_array.each do |ignored_regex|

      formatted_content = formatted_content.gsub(ignored_regex.to_regex, '')
    end
    
=begin    
    # BEGIN WORDS TO IGNORE
    words_to_ignore = ['the', 'to', 'and', 'of', 'a','that']
    ignored_regex = '('

    words_to_ignore.each do |ignore_word|
      ignored_regex = ignored_regex + '\b' +  ignore_word + '\b|'
    end

    ignored_regex = ignored_regex.chomp('|') + ')'

    reg = Regexp.new(ignored_regex, Regexp::IGNORECASE)
    formatted_content = formatted_content.gsub(reg, '')
    
    # END WORDS TO IGNORE
=end    
    
    if(case_sensitive)
      formatted_content.split.each do |word| # for each word
        word_hash[word] += 1 # add or increment
      end
    else
      formatted_content.split.each do |word| # for each word
        word_hash[word.downcase] += 1 # add or increment (case insensitive)
      end
    end
    
    return word_hash.sort {|a,b| b[1] <=> a[1]}
    
  end
  
end
# == Schema Information
#
# Table name: documents
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

