class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.7.7"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.0.0/credhub-darwin-2.0.0.tgz"
  sha256 "2951e134775dd240ca488488fb8f4059b340f9cf0ee4a5555225371ff46a9f8f"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
