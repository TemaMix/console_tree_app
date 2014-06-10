require 'spec_helper'

describe ValidTree do

  context "valid_tree use valid params" do
    let(:params) {{:volume=>2, :weight=>2, :proviso=>1}}
    case_params = {case_1:{:volume=>2, :weight=>2, :proviso=>1},
                   case_3:{:volume=>100, :weight=>1, :proviso=>1},
                   case_4:{:volume=>1, :weight=>1, :proviso=>1}
    }

    case_params.each_pair do |key, value|
      it "[#{key}] method valid should return validate params hash" do
        expect(ValidTree.new(value).valid).to eq(value)
      end
    end

  end

  context 'valid_tree use invalid params' do
    case_params = {case_1:{:volume=>2, :weight=>2, :proviso=>3},
                   case_2:{:volume=>0, :weight=>-1, :proviso=>0},
                   case_3:{:volume=>101, :weight=>4, :proviso=>5},
                   case_4:{:volume=>3, :weight=>-1, :proviso=>0}
    }

    case_params.each_pair do |key, value|
      it "[#{key}] method valid raise exception" do
        expect(ValidTree.new(value).valid).to raise_exception
      end
    end
  end

end