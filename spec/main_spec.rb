require_relative '../main.rb'   
RSpec.describe Game_table do
    describe '#create_table' do
      it "says hello" do
        expect(Game_table.new.create_table).to eq("Hello, world!")
      end
    end
  end