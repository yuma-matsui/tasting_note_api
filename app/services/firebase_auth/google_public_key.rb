# frozen_string_literal: true

require 'net/http'

module FirebaseAuth
  class GooglePublicKey
    CERT_URL = 'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com'

    attr_reader :public_key

    def self.get(key_id)
      new(key_id).public_key
    end

    def initialize(key_id)
      certificate = fetch_cert[key_id]
      raise 'Firebase ID has invalid kid.' unless certificate

      @public_key = OpenSSL::X509::Certificate.new(certificate).public_key
    end

    private

    def fetch_cert
      uri = URI.parse(CERT_URL)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      result = JSON.parse(https.start { https.get(uri.request_uri) }.body)
      raise 'Fetching Error. Not get certificate.' if result['error']

      result
    end
  end
end
