class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.5.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.5.0/credhub-darwin-1.5.0.tgz"
  sha256 "28a7ee41a7c3d359e83de9fa43a2232099da2e7ef0911edc0b0ed583fc0a2a1b"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
