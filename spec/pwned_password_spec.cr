require "./spec_helper"

describe PwnedPassword do
  it "returns true for known exposed passwords" do
    PwnedPassword.search("correct horse battery staple").nil?.should be_false
    PwnedPassword.search("f7Yr,f9dffF?eKeDpjepGwcc").nil?.should be_true # might have to change this periodically...
  end
end
