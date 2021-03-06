require 'spec_helper'

describe 'packer' do
	context 'with default parameters on Linux 64-bit' do
	let(:facts) { {
		:architecture => 'x86_64',
		:kernel => 'Linux',
		:packer_version => '0.10.0',
	} }

	# required for module archive
	let(:environment) { 'production' }

	it { should compile }
	it { should contain_class('packer') }

	it do
	  is_expected.to contain_archive('/tmp/packer_0.10.1_linux_amd64.zip').with({
	    'source' => 'https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip',
	  })
	end
	end
end
