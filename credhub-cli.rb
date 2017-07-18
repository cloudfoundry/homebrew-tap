class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.2.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.2.0/credhub-darwin-1.2.0.tgz"
  sha256 "d26b418968dcc116bf300d17bc8c8c4f3ce0de8343e897d61fe2b687716a0be8"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
