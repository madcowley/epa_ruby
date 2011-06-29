require 'helper'

describe EPA::Client::Pcs do

  before do
    @client = EPA::Client::Pcs.new
  end
  
  describe ".catalog" do
    
    it "should return the correct list of databases when empty" do
      test = @client.catalog()
      test[0].should == "ADMIN_PENALTY_ORDER"
    end
    
    it "should return the columns for a given database" do
      test = @client.catalog("ADMIN_PENALTY_ORDER")
      test[0].should == 'JUDICIAL_APPEAL_FILED_DATE'
    end
  end
  
  describe ".admin_penalty_order" do
    before do
      stub_get("PCS_ADMIN_PENALTY_ORDER/NPDES/AKG520535").
        to_return(:status => 200, :body => fixture("admin_penalty_order.xml"))
    end
    
    it "should return the columns for a given database" do
      test = @client.admin_penalty_order(:column => "NPDES", :value => "AKG520535")
      a_get("PCS_ADMIN_PENALTY_ORDER/NPDES/AKG520535").should have_been_made
      test.pcs_admin_penalty_order_list.pcs_admin_penalty_order.npdes.should == 'AKG520535'
    end
  end
  
  describe ".permit_event" do
    before do
      stub_get("pcs_permit_event/NPDES/AKG520535").
        to_return(:status => 200, :body => fixture("pcs_permit_event.xml"))
    end
    
    it "should return the columns for a given database" do
      test = @client.permit_event(:column => "NPDES", :value => "AKG520535")
      a_get("pcs_permit_event/NPDES/AKG520535").should have_been_made
      test.pcs_permit_event_list.pcs_permit_event[0].npdes.should == 'AKG520535'
    end
  end
  
  describe ".pipe_sched_lat_long" do
    before do
      stub_get("pcs_pipe_sched_lat_long/NPDES/ALG120113").
        to_return(:status => 200, :body => fixture("pcs_pipe_sched_lat_long.xml"))
    end
    
    it "should return the columns for a given database" do
      test = @client.pipe_sched_lat_long(:column => "NPDES", :value => "ALG120113")
      a_get("pcs_pipe_sched_lat_long/NPDES/ALG120113").should have_been_made
      test.pcs_pipe_sched_lat_long_list.pcs_pipe_sched_lat_long[0].npdes.should == 'ALG120113'
    end
  end
  
end