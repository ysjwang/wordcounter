class DocumentsController < ApplicationController
	def wordcount

		


    # Load all current pre-defined ignore_groups in the system
    @ignore_groups = IgnoreGroup.all

    # Find out which groups are being ignored
    @checked_ignore_groups = params[:ignore_group] || [] # for view's purposes
    ignore_regex_array = IgnoreGroup.build_array_from_ids(params[:ignore_group])

    # Check custom ignore
    if params.has_key?(:custom_ignore)
    	custom_ignore_group = IgnoreGroup.new(words: params[:custom_ignore])
    	ignore_regex_array.push(custom_ignore_group)
    end
    

    if params.has_key?(:document)
    	# A document has been input
    	@document = Document.new_from_count(params[:document][:content], ignore_regex_array, case_sensitive: false)

    else
			# Start a fresh demo document
			@document = Document.new_from_count("Enter some content here.", ignore_regex_array, case_sensitive: false)
		end

		# Results
    @count_results = @document.word_hash
    @total_word_count = @document.total_words
    @largest_count = @document.largest_count
    
    
    
  end

  def ajax_count

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
