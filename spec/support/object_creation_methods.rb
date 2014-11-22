
def create_cat(overrides = {})
  cat = Cat.create!({
      :name => 'Omar'
    }.merge(overrides)
end


def create_toy(cat, overrides = {})
  toy = Toy.create!(
      :name => 'Yarn ball',
      :cat_id => cat.id
  ).merge(overrides)
end


#  example of how you use it in the spec
# cat = create_cat
# create_cat(:name => "awesomeshife")
