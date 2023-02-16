# frozen_string_literal: true

module FirebaseAuth
  mattr_accessor :algorithm
  self.algorithm = 'RS256'

  def self.decode(token, key = nil, verify = false, options = {})
    payload, header = JWT.decode(token, key, verify, options)
    { payload: payload, header: header }

    rescue JWT::ExpiredSignature
      raise 'Firebase ID token has expired.'
    rescue => e
      raise "Firebase ID token has invalid signature. #{e.message}"
  end
end
