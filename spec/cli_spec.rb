require 'spec_helper'

describe 'bundle executable' do
  it 'returns non-zero exit status when passed unrecognized options' do
    mami '--invalid_argument', :exitstatus => true
    expect(exitstatus).to_not be_zero
  end
end
