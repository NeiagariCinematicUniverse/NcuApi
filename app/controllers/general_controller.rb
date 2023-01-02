require 'openssl'

class GeneralController < ApplicationController
    def check_id
        key = decrypt_key
        processedPass = params[:validationString]

        if (processedPass != key) then
            #Invalid
            head :unauthorized
            return
        end
    end

    private
    
    def decrypt_key
        key = nil
        iv = nil
        encrypted = nil

        File.open("./.key") {|f| key = Marshal.load(f)}
        File.open("./.iv") {|f| iv = Marshal.load(f)}
        File.open("./.key.enc") {|f| encrypted = Marshal.load(f)}

        decipher = OpenSSL::Cipher::AES.new(256, :CBC)
        decipher.decrypt
        decipher.key = key
        decipher.iv = iv

        decrypted = decipher.update(encrypted) + decipher.final
        return decrypted
    end
end