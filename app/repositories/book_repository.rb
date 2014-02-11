class BookRepository
  def find_by_keywords value
    keys = value.split(/\s+/)
    books = Arel::Table.new :books
    sql = books.project(Arel.sql('*'))
    keys.each do |key|
      sql = sql.where(books[:title].matches('%' + key + '%').or(books[:author].matches('%' + key + '%')).or(books[:manufacturer].matches('%' + key + '%')))
    end
    sql = sql.to_sql
    Book.find_by_sql(sql)
  end
end