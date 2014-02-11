class BookRepository
  def find_by_title_author value
    books = Arel::Table.new :books
    sql = books.project(Arel.sql('*')).where(books[:title].matches('%' + value + '%').or(books[:author].matches('%' + value + '%'))).to_sql
    Book.find_by_sql(sql)
  end
end