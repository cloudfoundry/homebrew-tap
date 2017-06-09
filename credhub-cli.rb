class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.0.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.0.0/credhub-darwin-1.0.0.tgz"
  sha256 "9095cdf15c39fced8778a2ece054a535ae8f7df46d504da8c2596547d0449787"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
