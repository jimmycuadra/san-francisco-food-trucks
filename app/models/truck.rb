class Truck
  include Mongoid::Document

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
