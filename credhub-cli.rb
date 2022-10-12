class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.5"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.5/credhub-darwin-2.9.5.tgz"
    sha256 "4bd99fafb367b4f94e70ca4ac44739a14c33176ed4b93411e1431a3dcb61e0d4"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.5/credhub-linux-2.9.5.tgz"
    sha256 "ecdb581bf09b4218de40af1943609f0815120fd2a1680cee2013fdf938c9a8e0"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
