class BooksRepresenter
  def initialize books
    @books = books
  end

  def as_json
    response = @books.map do |book|
      {
        id: book.id,
        title: book.title,
        author_name: author_full_name(book),
        author_age: book.author.age
      }
    end

    return response
  end

  private

  def author_full_name book
    return "#{book.author.first_name} #{book.author.last_name}"
  end
end
