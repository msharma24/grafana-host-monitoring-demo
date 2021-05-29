require 'spec_helper'

describe package('influxdb') do
  it { should be_installed }
end

describe service('influxdb') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/influxdb/influxdb.conf') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end


describe command('sudo apt-cache show influxdb') do
  its(:stdout) { should contain('Version: 1.8.3-1') }
end

describe package('collectd') do
  it { should be_installed }
end

describe service('collectd') do
  it { should be_enabled }
  it { should be_running }
end

describe command('sudo apt-cache show collectd') do
  its(:stdout) { should contain('Version: 5.7.2-2ubuntu1.2') }
end

describe file('/etc/collectd/collectd.conf') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe package('grafana') do
  it { should be_installed }
end

describe service('grafana-server') do
  it { should be_enabled }
  it { should be_running }
end

describe command('sudo apt-cache show grafana') do
  its(:stdout) { should contain('Version: 7.3.4') }
end

describe file('/etc/apt/sources.list.d/grafana-repository.list') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
end

describe file('/etc/apt/sources.list.d/influxdb-repository.list') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
end

describe command('cat /etc/apt/sources.list.d/grafana-repository.list') do
  its(:stdout) { should contain('deb https://packages.grafana.com/oss/deb stable main') }
end

describe command('cat /etc/apt/sources.list.d/influxdb-repository.list') do
  its(:stdout) { should contain('deb https://repos.influxdata.com/ubuntu trusty stable') }
end
