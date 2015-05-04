class List
  attr_reader(:name)

  define_method (:initialize) do |attributes|
    @list_name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      description = list.fetch("name")
      lists.push(List.new({:description => name}))
    end
    lists
  end



end
