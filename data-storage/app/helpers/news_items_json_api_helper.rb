module NewsItemsJsonApiHelper

	def filter_news(objects, search)
	  if  search
	    key = "%#{search}%"
	    objects = objects.where('title LIKE :search OR author LIKE :search OR description LIKE :search OR url LIKE :search', search: key)
	  end
	  return objects
	end


    def paginate(objects, page_object)
      if page_object
        if page_object.has_key?("number")
          objects = objects.page(page_object[:number])
        end
        if page_object.has_key?("size")
          objects = objects.per(page_object[:size])
        end

       else
       	objects = objects.page(1).per(20)
      end
      return objects
    end
end
