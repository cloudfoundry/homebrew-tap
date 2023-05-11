class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.15"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.15/credhub-darwin-2.9.15.tgz"
    sha256 "1c2b3a993c33946e77eecf5609d311e2520055949560f2ac0a30e758bde745dd"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.15/credhub-linux-2.9.15.tgz"
    sha256 "d61c738f65004afd35ed8dd5d17f57d0f1700629ad29e5335b906746f8958026"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
