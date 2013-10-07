class DocumentsController < ApplicationController
  def wordcount
    @document = Document.new(:content => "Enter some content here.")
    @ignore_groups = IgnoreGroup.all

    if params.has_key?(:document)
      @document.content = params[:document][:content]
    end
    
    
    
    ignore_regex_array = []
    @checked_ignore_groups = []
    if params.has_key?(:ignore_group)
      params[:ignore_group].each do |ignore_group_id|
        ignore_group = IgnoreGroup.find_by_id(ignore_group_id[1].to_i)

        ignore_regex_array.push(ignore_group)
        @checked_ignore_groups[ignore_group_id[1].to_i] = true
      end
    end
    
    if params.has_key?(:custom_ignore)
      custom_ignore_group = IgnoreGroup.new(:words => params[:custom_ignore])
      ignore_regex_array.push(custom_ignore_group)
    end
    
    


    @count_results = @document.count_words(false, ignore_regex_array)
    @total_word_count = @count_results.sum {|word| word[1]}
    
  end

end
