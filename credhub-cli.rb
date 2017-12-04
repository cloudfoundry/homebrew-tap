class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.5.1-rc.1"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.5.1-rc.1/credhub-darwin-1.5.1-rc.1.tgz"
  sha256 "881c2fa5ac232ca06ce4a84ed8b86e516863e992fae4c0061ab1f14d9d5088f1"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
