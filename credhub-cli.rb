#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.54"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.54/credhub-darwin-arm64-2.9.54.tgz"
      sha256 "eec57b4975704ed811a1fc347129e39096c3e07372fd70586ae28853040402fb"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.54/credhub-darwin-amd64-2.9.54.tgz"
      sha256 "d75890aa1a9e88d6325c19f72ed9a737d5d0d596a3d4ebd11c70451c0b4fd4e7"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.54/credhub-linux-amd64-2.9.54.tgz"
    sha256 "7636fba8754a8cf6afeb9ff6878f1fabd189d3831fe9b4487c8feced82678009"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
