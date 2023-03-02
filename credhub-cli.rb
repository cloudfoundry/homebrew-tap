class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.12"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.12/credhub-darwin-2.9.12.tgz"
    sha256 "e49bcb3f47fdc1b05c645ba6bdbcf847a63e411a02b919cd218a8f19eddc03a4"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.12/credhub-linux-2.9.12.tgz"
    sha256 "9fedfc3c41f2e8cf2a73de2109b59f5cb6cdf637c527382ac0d1cb40f9d2b09f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
