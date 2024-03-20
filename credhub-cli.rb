#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.28"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.28/credhub-darwin-arm64-2.9.28.tgz"
      sha256 "524140869a73f24b6e1aac17102c6753d93275fe63fd0201849bc152c5eee7f5"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.28/credhub-darwin-amd64-2.9.28.tgz"
      sha256 "6666444c73161f1598c05c09cf723384594b26a3c3e354d9703712347de1d1fa"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.28/credhub-linux-amd64-2.9.28.tgz"
    sha256 "433eb344557d585e674a6fd1f46103cfc36ae369c5e3483f7b19a4568d30c6d3"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
