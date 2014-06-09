require 'spec_helper'

describe Tree do
  let(:instance) {Tree.new()}

  describe 'calculate method should give correct result' do
    it '[one] N:3 A:3 D:2 result:3 ' do
      instance.setup_value(weight: 3,volume: 3,proviso: 2)
      expect(instance.calculate).to eq(3)
    end

    it '[two] N:3 A:3 D:3 result:1' do
      instance.setup_value(weight: 3,volume: 3,proviso: 3)
      expect(instance.calculate).to eq(1)
    end

    it '[three] N:4 A:3 D:2 result:6' do
      instance.setup_value(weight: 3,volume: 3,proviso: 2)
      expect(instance.calculate).to eq(6)
    end

    it '[four]  N:4 A:5 D:2 result:7' do
      instance.setup_value(weight: 4,volume: 5,proviso: 2)
      expect(instance.calculate).to eq(7)
    end

  end

  describe 'create_tree method should give correct result' do
    it '[one] N:3 A:3  result:4 ' do
      instance.setup_value(weight: 2,volume: 2)
      expect(instance.create_tree).to eq(4)
    end
  end




  describe 'calculate_proviso_path method should correct result' do

    it '[one] N:3 A:3 D:2  result:4 ' do
      instance.setup_value(weight: 3,volume: 3, proviso:2)
      expect(instance.calculate_proviso_path).to eq(4)
    end
  end

  describe 'calculate method should exception' do

    it 'when tree volume > 100' do
      expect{ instance.setup_value(volume:101) }.to raise_error(Errors::TreePropertyBadValue)
    end

    it 'when tree proviso take value > tree volume' do
      expect{ instance.setup_value(proviso:5,volume:4) }.to raise_error(Errors::TreePropertyBadValue)
    end

    describe 'when tree properties apply value < 1' do
      [:weight, :proviso, :volume].each do  |property|
        it "when tree #{property} apply value < 1" do
          expect{ instance.setup_value(Hash[property, 0]) }.to raise_error(Errors::TreePropertyBadValue)
        end
      end
    end

    describe 'when tree properties apply float value' do
       [:weight, :proviso, :volume].each do  |property|
         it "when tree #{property} apply float value" do
           expect{instance.setup_value(Hash[property,1.5]) }.to raise_error(Errors::TreePropertyBadValue)
         end
       end
    end

  end

end