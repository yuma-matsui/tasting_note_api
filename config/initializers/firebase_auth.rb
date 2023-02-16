# frozen_string_literal: true

module FirebaseAuth
  mattr_accessor :algorithm
  self.algorithm = 'RS256'
end
