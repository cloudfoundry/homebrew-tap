class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.6"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.6/credhub-darwin-2.9.6.tgz"
    sha256 "637bae0b7c4953578abdb3cc6ab0cdcac2de810344a26073f75bb362079f9f0e"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.6/credhub-linux-2.9.6.tgz"
    sha256 "763dd11813335fe167435bd7b83caf13d69c68f82e2246b3288c14a475e1d1e1"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
