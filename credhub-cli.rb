class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.6.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.6.0/credhub-darwin-1.6.0.tgz"
  sha256 "507aec2f11f20ffd0ae0ef74ba41bbaf63829f5c1cb5d885a778e1fc6e9c396e"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
