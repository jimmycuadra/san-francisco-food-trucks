class Truck
  include Mongoid::Document

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

  field :location, type: Hash
  field :status, type: String
  field :expirationdate, type: DateTime
  field :permit, type: String
  field :block, type: String
  field :received, type: DateTime
  field :facilitytype, type: String
  field :blocklot, type: String
  field :locationdescription, type: String
  field :cnn, type: Integer
  field :priorpermit, type: Integer
  field :schedule, type: String
  field :address, type: String
  field :applicant, type: String
  field :lot, type: String
  field :fooditems, type: String
  field :longitude, type: BigDecimal
  field :latitude, type: BigDecimal
  field :objectid, type: Integer
  field :y, type: BigDecimal
  field :x, type: BigDecimal
  field :approved, type: DateTime
  field :noisent, type: DateTime

  validates_presence_of :objectid, :longitude, :latitude, :address, :applicant
end
