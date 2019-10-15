require_relative '../../spec_helper'

describe Autotest::FSEvent do
  it "must be defined" do
    _(Autotest::FSEvent::VERSION).wont_be_nil
  end
end
