#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.50"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.50/credhub-darwin-arm64-2.9.50.tgz"
      sha256 "d0f03e6777c8ff2b5970f59eccaf76a9ec20ea99876838dd2ba1979ec433104b"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.50/credhub-darwin-amd64-2.9.50.tgz"
      sha256 "ea63f6fbc230b39d49ccfd4b153f2721e9e168b29b84c9eb7fcd7cd98608efb0"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.50/credhub-linux-amd64-2.9.50.tgz"
    sha256 "75990895ec297442750dd7221919edb4d90dad6fbffd16ccdd55c54f399e5c8d"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
