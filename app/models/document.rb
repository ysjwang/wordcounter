class Document < ActiveRecord::Base

  attr_accessor :word_hash, :total_words, :largest_count

  #def count_words(case_sensitive, ignored_regex_array=[])
  def count_words(ignored_regex_array=[], options={})

    formatted_content = self.content # prepare formatted_content
    
    # Sanitzie the content
    word_hash = Hash.new(0) # new hash to store
    formatted_content = formatted_content.gsub(/[\,\.\"\!\?\@\#\$\%\/\&\(\)]/i,' ')


    # Submit the content iteratively through each entry of words to ignore
    ignored_regex_array.each do |ignored_regex|
      formatted_content = formatted_content.gsub(ignored_regex.to_regex, '')
    end

    
    # Count each word
    if(options[:case_sensitive])
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


  def self.new_from_count(content, ignored_regex_array=[], options={})


    if !content.blank?
      # Create a new document
      document = Document.new(content: content)

      # format content for parsing, removing punctuation etc
      formatted_content = content.gsub(/[\,\.\"\!\?\@\#\$\%\/\&\(\)]/i,' ')


      # Sanitzie the content
      word_hash = Hash.new(0) # new hash to store
      formatted_content = formatted_content.gsub(/[\,\.\"\!\?\@\#\$\%\/\&\(\)]/i,' ')

      # Submit the content iteratively through each entry of words to ignore
      ignored_regex_array.each do |ignored_regex|
        formatted_content = formatted_content.gsub(ignored_regex.to_regex, '')
      end


      # Count each word
      if(options[:case_sensitive])
        formatted_content.split.each do |word| # for each word
          word_hash[word] += 1 # add or increment
        end
      else
        formatted_content.split.each do |word| # for each word
          word_hash[word.downcase] += 1 # add or increment (case insensitive)
        end
      end

      document.word_hash = word_hash.sort {|a,b| b[1] <=> a[1]}
      document.total_words = word_hash.sum {|word| word[1]}
      document.largest_count = word_hash.count > 0 ? word_hash.first[1] : 0

      # @count_results.sum {|word| word[1]}
      return document
    end



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

