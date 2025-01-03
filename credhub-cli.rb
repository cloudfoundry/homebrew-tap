#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.41"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.41/credhub-darwin-arm64-2.9.41.tgz"
      sha256 "4ada12f31d7dd70f4ac0e5c42441607b7b5faa5359f7e3519be76ccea9488f0a"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.41/credhub-darwin-amd64-2.9.41.tgz"
      sha256 "0e778f556e56d6e464e8a9709a4915cd8fd24b9c6445afadb5080525133ff4df"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.41/credhub-linux-amd64-2.9.41.tgz"
    sha256 "fbf6ac982cff11beb4736b0d37ce333e0bc625a26933c1c42e1daa940f02faaf"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
