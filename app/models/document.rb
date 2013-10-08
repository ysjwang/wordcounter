class Document < ActiveRecord::Base
  
  def count_words(case_sensitive, ignored_regex_array=[])
    
    formatted_content = self.content # prepare formatted_content
    
   
    word_hash = Hash.new(0) # new hash to store
    formatted_content = formatted_content.gsub(/[\,\.\"\!\?\@\#\$\%\/\&\(\)]/i,' ')
   

    ignored_regex_array.each do |ignored_regex|

      formatted_content = formatted_content.gsub(ignored_regex.to_regex, '')
    end
     
    
    if(case_sensitive)
      formatted_content.split.each do |word| # for each word
        word_hash[word] += 1 # add or increment
      end
    else
      formatted_content.split.each do |word| # for each word
        word_hash[word.downcase] += 1 # add or increment (case insensitive)
      end
    end
    
    # returns a sorted array already
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

