class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.8"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.8/credhub-darwin-2.9.8.tgz"
    sha256 "d49dcefab988d395848e19fd2a1c390129f20769622aa6bc4493f7835dd30e1c"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.8/credhub-linux-2.9.8.tgz"
    sha256 "76fa3f2dcf9f7fa882de2ffbc8b55d9a8bd5c469214c68d1faaa772c72bdd2ae"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
