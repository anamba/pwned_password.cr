require "digest/sha1"
require "http/client"

# Implements API v2 of Troy Hunt's HIBP to check whether a given password has been exposed in a breach.
#
# ```
# PwnedPassword.search("correct horse battery staple") # -> 2 (found in 2 breaches)
# PwnedPassword.search("f7Yr,f9dffF?eKeDpjepGwcc")     # -> nil (not found)
# ```
module PwnedPassword
  VERSION = "0.1.1"

  class Error < Exception
  end

  def self.search(pass : String, raise_on_api_error = false) : Int32?
    hash = Digest::SHA1.hexdigest(pass)
    prefix = hash[0...5]
    suffix = hash[5..-1]

    response = HTTP::Client.get "https://api.pwnedpasswords.com/range/#{prefix}"
    if response.status_code == 200
      response.body.each_line do |line|
        if line =~ /^#{suffix}\:(\d+)$/i && (occurrences = $1.to_i?)
          return occurrences
        end
      end
    else
      if raise_on_api_error
        raise Error.new("api.pwnedpasswords.com returned #{response.status_code}")
      end
    end

    # we choose to fail open (unless raise_on_api_error = true)
    nil
  end
end
