require 'thrall'
describe Thrall::Core do
  
  describe 'without bastion host' do
    before :each do
      opts = {}
      opts[:host_defs] = {
        'foo' => {'host' => 'bar.fake.com', 'fqdn' => "foo.fake.com"}
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