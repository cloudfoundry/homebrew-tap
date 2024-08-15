#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.36"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.36/credhub-darwin-arm64-2.9.36.tgz"
      sha256 "19f5655e01ccb8c6f13127e355bf3786b010dd8b5dd56c25c381ad64c77c8c02"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.36/credhub-darwin-amd64-2.9.36.tgz"
      sha256 "a2de29c536250b09447f7595294415c67b1ff12372f8cdb4c9bfadebaedf8455"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.36/credhub-linux-amd64-2.9.36.tgz"
    sha256 "dc4ec7efe87cbd7e83c0c43467a7b361b655a831c4ec4d6af0b15f21038db97e"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
