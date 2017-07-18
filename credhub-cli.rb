class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.2.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.2.0/credhub-darwin-1.2.0.tgz"
  sha256 "764c872146f11f4f487d41d3de02a82974682b480fda6ef33c5302fbfd744b6b"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
