class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.5.1"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.5.1/credhub-darwin-1.5.1.tgz"
  sha256 "947743fd68c782d10300738d7f164ebc87015f74611ee422cb1288de5cb19c64"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
