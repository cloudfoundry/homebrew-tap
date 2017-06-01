class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "0.8.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/0.8.0/credhub-darwin-0.8.0.tgz"
  sha256 "b6bd00faaa257a609836c9ef50f30e50dbd1e3115b0035d8cc24264a51062dfe"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
