class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.5.3"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.5.3/credhub-darwin-1.5.3.tgz"
  sha256 "12e25c3a4dc092e09a605235de44710368cc2425425f0c40c2233d3ce97166bf"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
