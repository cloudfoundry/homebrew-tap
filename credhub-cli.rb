class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "0.8.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/0.8.0/credhub-darwin-0.8.0.tgz"
  sha256 "291e8e67ef00bf1a1b58024bdd995d873fc19050b0f6623853c4b6c8955489f7"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
