# frozen_string_literal: true

module FirebaseAuth
  class TokenErrors
    ISSUER_BASE_URL = 'https://securetoken.google.com/'
    BASE_ERROR_MESSAGE = 'Firebase ID token has '

    attr_reader :header, :payload, :messages

    def self.check(token)
      error_messages = new(token).messages
      raise error_messages.join("\n") unless error_messages.empty?
    end

    def initialize(token)
      raise 'ID token must be a String' unless token.is_a?(String)

      @payload, @header = FirebaseAuth.decode(token).values_at(:payload, :header)
      @messages = validate_token
    end

    private

    def issuer
      ISSUER_BASE_URL + project_id
    end

    def project_id
      Rails.application.credentials.production.firebase[:project_id]
    end

    def kid?
      @header['kid']
    end

    def sub?
      @payload['sub'].is_a?(String)
    end

    def sub_empty?
      @payload['sub'].empty?
    end

    def more_than_128_character_sub?
      @payload['sub'].size > 128
    end

    def valid_sub?
      sub? && !sub_empty? && !more_than_128_character_sub?
    end

    def valid_algorithm?
      @header['alg'] == FirebaseAuth.algorithm
    end

    def valid_audience?
      @payload['aud'] == project_id
    end

    def valid_issuer?
      @payload['iss'] == issuer
    end

    def validate_token
      errors = []

      errors << %(no "kid" claim.) unless kid?
      errors << %(incorrect algorithm.) unless valid_algorithm?
      errors << %(incorrect "aud"(audience) claim.) unless valid_audience?
      errors << %(incorrect "iss"(issuer) claim.) unless valid_issuer?
      errors << %(incorrect "sub" claim.) unless valid_sub?

      errors.map { |error| BASE_ERROR_MESSAGE + error }
    end
  end
end
