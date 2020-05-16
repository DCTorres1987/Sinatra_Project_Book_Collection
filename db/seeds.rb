@books = API.fetch
            @books["items"].each do |book|
        
                title = book["volumeInfo"]["title"]
                author = book["volumeInfo"]["authors"].join(" ")
                description = book["volumeInfo"]["description"]
                published_date = book["volumeInfo"]["publishedDate"]
                if book["volumeInfo"]["imageLinks"]
                    image = book["volumeInfo"]["imageLinks"]["thumbnail"]
                else
                    image = nil
                end
              #  if title == "Command and Control"

                 #   binding.pry
            #    end
                if Book.find_by(title: title, author: author, published_date: published_date) == nil
                   # binding.pry
                    Book.create(title: title, author: author, description: description, published_date: published_date, image: image)
                end
            end