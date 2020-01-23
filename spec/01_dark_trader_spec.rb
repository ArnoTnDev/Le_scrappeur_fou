require_relative '../lib/01_dark_trader'

describe "#final_array" do
    it "return an array of hashes" do
        expect(final(ash(nam_array(path_name(url)), val_array(path_value(url))))).not_to be_nil
    end
end




describe "#url" do
    it "return money name" do
        expect(nam_array(path_name(url()))).to include("BTC")
    end
    it "return money name"do
    expect(nam_array(path_name(url()))).to include("LTC")
    end
    it "return money name" do
        expect(nam_array(path_name(url()))).to include("XRP")
    end
end

