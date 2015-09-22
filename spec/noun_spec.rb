require 'infer_two_thousand'
require 'relation'
require 'spec_helper'

describe InferTwoThousand do
  after { Relation.all.clear }

  it "knows its name" do
    expect(subject.name).to eq("Infer2000")
  end
  describe "#interpret_statement" do
    it "calls the correct method to process a given statement" do
      expect(subject).to receive(:teach).with("all frogs are kings").once
      subject.interpret_statement("All Frogs are Kings")
      expect(subject).to receive(:query).with("are all frogs kings?").once
      subject.interpret_statement("Are All Frogs Kings?")
      expect(subject).to receive(:describe).with("describe frogs.").once
      subject.interpret_statement("Describe frogs.")
    end
  end
  describe "#teach" do
    it "should say ok when given a statement" do
      expect(subject.teach("All cats are felines")).to eq("Ok")
    end
    it "should say ok when given a statement" do
      subject.teach("All cats are felines")
      expect(Relation.all.size).to eq 1
    end
  end
  describe "#query" do
    # it "should "
  end
  describe "#describe" do
    it "tells you about the noun" do
      subject.teach("All frogs are kings")
      expect(subject.describe("frogs")).to eq "All frogs are kings."
    end
  end
end
