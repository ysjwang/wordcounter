class DocumentsController < ApplicationController
  def wordcount
    @document = Document.new(:content => "Enter some content here.")
    # @document = Document.new(:content => Document.first.content)
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


  def ajax_new_text_content

    puts "I AM IN AJAX"
    document = Document.find(1)
    respond_to do |format|
      @new_content = document.content.gsub(/\n/, '\n')
      format.html { redirect_to wordcount_documents_path }
      format.js

    end

  end

  def show
    puts 'WHY AM I IN SHOW??'
  end

end
