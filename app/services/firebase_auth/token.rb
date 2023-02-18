# frozen_string_literal: true

module FirebaseAuth
  class Token
    attr_reader :token

    def self.payload(token)
      new(token).token[:payload]
    end

    def initialize(token)
      TokenErrors.check(token)
      @token = FirebaseAuth.decode(token, GooglePublicKey.get(token), true, { algorithm: algorithm, verify_iat: true })
    end

    private

    def algorithm
      FirebaseAuth.algorithm
    end
  end
end
