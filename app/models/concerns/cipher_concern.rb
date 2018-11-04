require 'openssl'

module CipherConcern
  extend ActiveSupport::Concern

  def encrypted_id
    password = Rails.application.secret_key_base

    enc = OpenSSL::Cipher.new("aes-256-cbc")
    enc.encrypt
    enc.pkcs5_keyivgen(password)
    return Base64.urlsafe_encode64(enc.update(id.to_s) + enc.final).delete('=')
  end

  module ClassMethods
    def find_by_encrypted_id(encrypted_id)
      password = Rails.application.secret_key_base
      encrypted_id = encrypted_id + '=' * (-1 * encrypted_id.size & 3)
      encrypted_id = Base64.urlsafe_decode64(encrypted_id)
      dec = OpenSSL::Cipher.new("aes-256-cbc")
      dec.decrypt
      dec.pkcs5_keyivgen(password)
      find(dec.update(encrypted_id) + dec.final)
    end
  end
end