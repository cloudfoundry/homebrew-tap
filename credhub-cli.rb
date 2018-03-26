class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.7.3"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.7.3/credhub-darwin-1.7.3.tgz"
  sha256 "d86bbb331705d58d32ddccdb6a0b02682cc454d682fae246f4adaca4190d5ecb"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
