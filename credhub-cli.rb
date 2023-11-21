#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.23"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.23/credhub-darwin-arm64-2.9.23.tgz"
      sha256 "9079a48bdce09cfe68f48ca1689b34c76b8f430c7d90ffe3e7c817c1757c028b"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.23/credhub-darwin-amd64-2.9.23.tgz"
      sha256 "80af18dab2dede0fed60d4f3c4b93ecbe3274a2a25827bf88f3fc0d7184c4370"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.23/credhub-linux-amd64-2.9.23.tgz"
    sha256 "6d01603da5f4a5060d5f9fe91dda42d62b086e6f3ce74f13c644800a9a5d12d9"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
