# frozen_string_literal: true

class Image
  Aws.config.update(
    region: Rails.application.credentials.production.aws[:region],
    credentials: Aws::Credentials.new(
      Rails.application.credentials.production.aws[:access_key_id],
      Rails.application.credentials.production.aws[:secret_access_key]
    )
  )

  def self.signed_url(filename, operation)
    signer = Aws::S3::Presigner.new
    signer.presigned_url(
      operation,
      bucket: Rails.application.credentials.production.aws[:bucket_name],
      key: filename
    )
  end
end
