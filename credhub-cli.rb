#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.38"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.38/credhub-darwin-arm64-2.9.38.tgz"
      sha256 "a5ae9d9b99210765cc8845f42f7b367a00e51d2361b4af6f9ae8f7341ae0b2ce"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.38/credhub-darwin-amd64-2.9.38.tgz"
      sha256 "2a3e64895da7973505930427729e5aa8648ec39e14e195c314bf6c4261e8c44c"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.38/credhub-linux-amd64-2.9.38.tgz"
    sha256 "65ab751a2453ff03c87a6aedc9fb8cd3dda7ee967b54ed9026551e2aa70f9beb"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
