class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.2.1"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.2.1/credhub-darwin-2.2.1.tgz"
  sha256 "50d43427082d204e3afdcd52f9a4a959d7e3ec5a93a501c90721768e430030ad"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
