require 'spec_helper'

describe 'bundle executable' do
  it 'returns non-zero exit status when passed unrecognized options' do
    mami '--invalid_argument'
    expect(err).to include('Unknown switches')
  end
end

describe 'common case' do
  it 'returns common output' do
    mami ''
    expect(out).to eq('/path/to/mami/2011-08-28-12-34-56.txt')
  end
end
