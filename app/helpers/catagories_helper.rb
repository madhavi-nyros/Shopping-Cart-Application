module CatagoriesHelper
def find
@products=Product.find_by_sql( "SELECT * FROM products p, categories c WHERE c.id = p.category_id")
end
end
