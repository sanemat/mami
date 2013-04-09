require 'spec_helper'

describe 'bundle executable' do
  it 'returns non-zero exit status when passed unrecognized options' do
    mami '--invalid_argument'
    expect(err).to include('Unknown switches')
  end
end

describe 'common case' do
  before do
    ENV['MAMI_DIR'] = "/path/to/mami"
  end

  it 'returns common output' do
    mami ''
    expect(out).to match(%r!/path/to/mami/\d{4}-\d{2}-\d{2}-\d{2}-\d{2}-\d{2}\.txt!)
    expect(err).to eq('')
  end
end

describe 'no config env' do
  it 'returns error' do
    mami ''
    expect(err).to eq('mami requires MAMI_DIR or directory option')
  end
end
