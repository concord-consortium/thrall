require 'thrall'
describe Thrall::Core do
  
  describe 'without bastion host' do
    before :each do
      opts = {}
      opts[:host_defs] = {
        'foo' => {'host' => 'bar.fake.com', 'fqdn' => "foo.fake.com"},
        'baz' => {'host' => 'bar.fake.com', 'fqdn' => "baz.fake.net"}
      }
      @serverator = Thrall::Core.new(opts)
    end

    it "host should return a complete server name" do
      @serverator.host("foo")['host'].should == "bar.fake.com"
    end

    it "uses the user name in ssh commands" do
      @serverator.ssh_cmds("foo").should == "ssh -t deploy@bar.fake.com"
    end

    it "can open a webbrowser to the host" do
      @serverator.www_cmds("foo").should == "open http://foo.fake.com"
    end

    it "can use remote screens" do
      @serverator.screen_cmds("foo").should == "ssh -t deploy@bar.fake.com screen -xR foo"
    end

    it "can find servers" do
      @serverator.find('blarg').should be_empty
      @serverator.find('').should have(2).host      # all hosts
      @serverator.find('foo').should have(1).host   # by short name
      @serverator.find('baz').should have(1).host   # by short name
      @serverator.find('fake').should have(2).host  # by fqdn
      @serverator.find('com').should have(1).host   # by fqdn
      @serverator.find('net').should have(1).host   # by fqdn
    end
  end

  describe 'with bastion host' do
    before :each do
      opts = {}
      opts[:host_defs] = {
        'foo' => {
          'host' => 'bar.fake.com', 
          'fqdn' => "foo.fake.com",
          'bastion' => "bastion.fake.com"
        }
      }
      @serverator = Thrall::Core.new(opts)
    end

    it "uses the user name in ssh commands" do
      @serverator.ssh_cmds("foo").should == "ssh -At bastion.fake.com 'ssh -t deploy@bar.fake.com'"
    end

    it "can use remote screens" do
      @serverator.screen_cmds("foo").should == "ssh -At bastion.fake.com 'ssh -t deploy@bar.fake.com screen -xR foo'"
    end
  end

end