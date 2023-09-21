#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.21"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.21/credhub-darwin-arm64-2.9.21.tgz"
      sha256 "941d83a2cd0bcaa22a1dfaa4b9a78f5e23ee400eb1afc37755242a05aabb3bcb"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.21/credhub-darwin-amd64-2.9.21.tgz"
      sha256 "9ae0deb744b8a50e8b39328d71fbd84d055e4a091a8e590ac5ba7bd6f471399a"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.21/credhub-linux-2.9.21.tgz"
    sha256 "1057982571f75b6ddadc52f99af213d2547bd5deea038e6a6f6938e703388f9d"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
