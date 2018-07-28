describe SortedArray do
  before :all do
    @sorting_engine = described_class.new{|x,y| x<=> y }
  end 
  it 'sort an array' do
    array = [1,5,3, 10]
    expected = [1,3,5, 10]
    expect(@sorting_engine.sort(array)).to eq(expected)
  end

  it 'get top n from array' do
    array = [1,5,3, 10]
    max1 = [10]
    max2 = [5,10]    
    expect(@sorting_engine.max_n(array,1)).to eq(max1)
    expect(@sorting_engine.max_n(array,2)).to eq(max2)    
  end
end

