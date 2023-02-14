# frozen_string_literal: true

module FirebaseAuth
  mattr_accessor :cert_url
  self.cert_url = 'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com'
end
