class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.4.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.4.0/credhub-darwin-1.4.0.tgz"
  sha256 "8da31de15b66462161291054203442dd05f573e9bd673da1c6d2fe0f49d44bcb"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
