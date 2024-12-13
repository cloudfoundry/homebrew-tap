#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.40"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.40/credhub-darwin-arm64-2.9.40.tgz"
      sha256 "3fcf9fdd857000f8bf3b8981e4b2cecbdd6c28ad9cb51f679005da0e6b722314"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.40/credhub-darwin-amd64-2.9.40.tgz"
      sha256 "5ae414e1e52b75e9b315e23631f79a6b2c45168ec4f54948a58096749d741188"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.40/credhub-linux-amd64-2.9.40.tgz"
    sha256 "70cb5723499102002599fbb1c218d9c4190a69d2d5a4a26f8798eadb81b1c3f8"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
