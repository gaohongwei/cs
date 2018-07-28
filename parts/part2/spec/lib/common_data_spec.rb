describe CommonData do
  include CommonData

  describe 'get_state_abbrevation method' do
    it 'California' do
      full_name = 'California'
      expect(get_state_abbrevation(full_name)).to eq('CA')
    end
    it 'Wrong state name' do
      full_name = 'CaliforniaZ'
      expect(get_state_abbrevation(full_name)).to eq(nil)
    end
  end

  describe 'same_state? method' do
    it 'California/CA: true' do
      state_of_address = 'CA'
      state_from_cli = 'California'
      expect(same_state?(state_of_address, state_from_cli)).to eq(true)
    end
    it 'CA/California: true' do
      state_of_address = 'California'
      state_from_cli = 'CA'
      expect(same_state?(state_of_address, state_from_cli)).to eq(true)
    end
    it 'AL/California: false' do
      state_of_address = 'California'
      state_from_cli = 'AL'
      expect(same_state?(state_of_address, state_from_cli)).to eq(false)
    end
    it 'CA/Californiaz: false' do
      state_of_address = 'Californiaz'
      state_from_cli = 'CA'
      expect(same_state?(state_of_address, state_from_cli)).to eq(false)
    end
    it 'CA/california: false' do
      state_of_address = 'california'
      state_from_cli = 'CA'
      expect(same_state?(state_of_address, state_from_cli)).to eq(false)
    end   
    it 'ca/California: false' do
      state_of_address = 'California'
      state_from_cli = 'ca'
      expect(same_state?(state_of_address, state_from_cli)).to eq(false)
    end     
  end

  describe 'in_state? method' do
    it '4km NE of Anza, CA is in CA? true' do
      address = '4km NE of Anza, CA'
      state_from_cli = 'CA'
      expect(in_state?(address, state_from_cli)).to eq(true)
    end

    it '4km NE of Anza, CA is in California? true' do
      address = '4km NE of Anza, CA'
      state_from_cli = 'California'
      expect(in_state?(address, state_from_cli)).to eq(true)
    end

    it '4km NE of Anza, CA is in ca? false' do
      address = '4km NE of Anza, CA'
      state_from_cli = 'ca'
      expect(in_state?(address, state_from_cli)).to eq(false)
    end

    it '4km NE of Anza, CA is in AL? false' do
      address = '4km NE of Anza, CA'
      state_from_cli = 'AL'
      expect(in_state?(address, state_from_cli)).to eq(false)
    end

    it '72km N of Pahrump, Nevada is in CA? flase' do
      address = '72km N of Pahrump, Nevada'
      state_from_cli = 'CA'
      expect(in_state?(address, state_from_cli)).to eq(false)
    end    
  end
end