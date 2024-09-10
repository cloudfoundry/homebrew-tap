#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.37"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.37/credhub-darwin-arm64-2.9.37.tgz"
      sha256 "997e45cca8220f344760734935db4475c67d2859d23df133b20d68934d709a55"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.37/credhub-darwin-amd64-2.9.37.tgz"
      sha256 "712b2e4062d56d6eb443eaf00a9df6b7e6c00b3867c7b666c9051254ba33bbee"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.37/credhub-linux-amd64-2.9.37.tgz"
    sha256 "a984df9ff47dc90e3adfd5f190da54fe49327287611ec8795b9681f02c9051ff"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
