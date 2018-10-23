module NewsItemsRestHelper
	def filter_news(objects, search)
	  
	  if  search
	    key = "%#{search}%"
	    objects = objects.where('title LIKE :search OR author LIKE :search OR description LIKE :search OR url LIKE :search', search: key)
	  else
	    objects = objects.all
	  end

	  return objects
	end
end
