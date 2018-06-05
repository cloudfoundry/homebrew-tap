class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.7.6"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.7.6/credhub-darwin-1.7.6.tgz"
  sha256 "491b7dd09ce9c39f6c4326015b82180a0b2651d293cf5243433a285a0a7b46ec"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
