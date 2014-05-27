require 'spec_helper'

describe 'fixhung' do

['Debian', 'RedHat', 'SuSe', 'SunOS' ].each do |system|
  describe "fixhung on #{system}" do
    let(:facts) {{ :osfamily => system }}
    let(:params) {{
      'max_age'  => '120',
      'pid_path' => '/var/run/sshd.pid',
   }}
  it { should contain_class('fixhung') }
  it { should contain_file('fix_hung.sh').with({
          'ensure'  => 'file',
          'path'    => '/usr/local/bin/fix_hung.sh',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '755',
     })
  }
  it { should contain_cron('fix_hung').with({
         'ensure'  => 'present',
         'command' => '/usr/local/bin/fix_hung.sh > /dev/null',
         'user'    => 'root',
         'hour'    => '0',
         'minute'  => '0',
     })
  }
  end
 end
end
