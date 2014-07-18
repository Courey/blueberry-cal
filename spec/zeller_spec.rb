require_relative '../lib/zeller'

RSpec.describe Zeller do
  context ".calculate" do
    it "returns 6 for weekday" do
      expected = 6
      actual = Zeller.calculate(9, 4, 1981)
      actual.should == expected
    end
    it "returns 6 for weekday" do
      expected = 6
      actual = Zeller.calculate(4, 16, 2004)
      actual.should == expected
    end
    it "returns 2 for weekday" do
      expected = 2
      actual = Zeller.calculate(2, 1, 1999)
      actual.should == expected
    end
    it "returns  for weekday" do
      expected = 2
      actual = Zeller.calculate(7, 21, 2014)
      actual.should == expected
    end
    # it "returns z for a" do
    #   ...
    # end
  end
end
