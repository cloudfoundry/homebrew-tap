#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.32"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.32/credhub-darwin-arm64-2.9.32.tgz"
      sha256 "ca6cd5593d80f16b3ec676cc9e6430617db5fe857d77f9e9ba7605ff5d964e2d"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.32/credhub-darwin-amd64-2.9.32.tgz"
      sha256 "b9190129fe17248833e04f7eb16f13d3d023902110a5c5f8088faafccf197748"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.32/credhub-linux-amd64-2.9.32.tgz"
    sha256 "a95c1132697b3e9f30b0b81f88ef6c550f04893318c361bcad5455530d358906"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
