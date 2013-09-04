require "spec_helper"

describe Truck do
  let(:params) do
    {
      "location" => {
        "needs_recoding" => false,
        "longitude" => "-122.398658184594",
        "latitude" => "37.7901490874965"
      },
      "status" => "REQUESTED",
      "expirationdate" => "2013-03-15T00:00:00",
      "permit" => "13MFF-0068",
      "block" => "3708",
      "received" => "Mar 14 2013  3:34PM",
      "facilitytype" => "Truck",
      "blocklot" => "3708055",
      "locationdescription" => "01ST ST: STEVENSON ST to JESSIE ST (21 - 56)",
      "cnn" => "101000",
      "priorpermit" => "0",
      "schedule" => "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=13MFF-0068&ExportPDF=1&Filename=13MFF-0068_schedule.pdf",
      "address" => "50 01ST ST",
      "applicant" => "Cupkates Bakery, LLC",
      "lot" => "055",
      "fooditems" => "Cupcakes",
      "longitude" => "-122.398658184604",
      "latitude" => "37.7901490737255",
      "objectid" => "427856",
      "y" => "2115738.283",
      "x" => "6013063.33"
    }
  end

  it "stores provided attributes" do
    subject = described_class.new(params)
    expect(subject.longitude).to eq(BigDecimal.new("-122.398658184604"))
    expect(subject.latitude).to eq(BigDecimal.new("37.7901490737255"))
    expect(subject.objectid).to eq(427856)
    expect(subject.applicant).to eq("Cupkates Bakery, LLC")
  end

  %w(objectid longitude latitude address applicant).each do |attrib|
    it "requires the #{attrib} attribute" do
      subject = described_class.new(params)
      subject[attrib] = nil
      expect(subject).not_to be_valid
      expect(subject).to have(1).error_on(attrib)
    end
  end
end
