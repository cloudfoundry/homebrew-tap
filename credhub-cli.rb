#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.64"

  if OS.mac?
    if Hardware::CPU.arm64?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.64/credhub-darwin-arm64-2.9.64.tgz"
      sha256 "8f3f80489a15fd637f57e2a770b73a20751db8b1a8b9073cf1f422df76643f6e"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.64/credhub-darwin-amd64-2.9.64.tgz"
      sha256 "80d466ba942e331dd405d2429f4b1d645a9b33d13b4de20247cf752ecdb8d4da"
    end
  elsif OS.linux?
    if Hardware::CPU.arm64?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.64/credhub-linux-arm64-2.9.64.tgz"
      sha256 "e0cbe7fca7e3aebe683f83ee681734a97b0ebba48dfd5af2afece4c4e5369d81"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.64/credhub-linux-amd64-2.9.64.tgz"
      sha256 "69fbcf85638934c0c71304e3ac0ea8aa2907b8372e3a96548200f61067f1a071"
    end
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
