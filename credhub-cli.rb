class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.7.0"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-darwin-2.7.0.tgz"
    sha256 "d76381a967a1cc6d8fdb5c3cd51a513895000b78ed934f569332325c9d16aa8f"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-linux-2.7.0.tgz"
    sha256 "a453c937caedbd15c30a348a6fd4a717bb321ce7c077d137ef2ea28eb8befb8b"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
