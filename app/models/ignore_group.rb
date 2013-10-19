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

  # build an ignore array from IDs
  def self.build_array_from_ids(array_of_ids)

    ignore_array = []
    if !array_of_ids.blank?
      array_of_ids.each do |ignore_group_id|
        ignore_group = IgnoreGroup.find_by_id(ignore_group_id)
        ignore_array.push(ignore_group)
      end
    end

    return ignore_array
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

