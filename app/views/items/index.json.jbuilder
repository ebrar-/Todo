json.items @items do |item|
	json.extract! item , :id , :content , :is_completed , :user
end