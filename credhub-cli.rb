#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.31"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.31/credhub-darwin-arm64-2.9.31.tgz"
      sha256 "3dd90e8230e0eff9506bc7f333fba221ae13e2385389df4d3a7362607768ce7d"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.31/credhub-darwin-amd64-2.9.31.tgz"
      sha256 "912c11735580955511c41ef80b29d7c8a9f3c25516ccdf7f034d23ce2451326d"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.31/credhub-linux-amd64-2.9.31.tgz"
    sha256 "caf1f35837ee780b1ab105dff0e8f35b2e0a691484eff7b16cda31b03d6f91df"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
