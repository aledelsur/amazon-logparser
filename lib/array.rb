class Array
  def most_repeated
    group_by{|i| i}.max{|x,y| x[1].length <=> y[1].length}[0] 
  end
end