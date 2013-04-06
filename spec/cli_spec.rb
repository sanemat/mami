require 'spec_helper'

describe 'bundle executable' do
  it 'returns non-zero exit status when passed unrecognized options' do
    mami '--invalid_argument'
    expect(err).to include('Unknown switches')
  end
end
