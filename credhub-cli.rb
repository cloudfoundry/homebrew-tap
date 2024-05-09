#
# This code has been automatically generated. Any changes will be overwritten.
#
class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.30"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.30/credhub-darwin-arm64-2.9.30.tgz"
      sha256 "060c50c12de1912e94579c714e62d6c834b86f44bb5eca3ad090d5a6a3d24eba"
    else
      url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.30/credhub-darwin-amd64-2.9.30.tgz"
      sha256 "e557512f1d170b8679d0b1a5696dec9767e8654cf0c986edaec3f437900bf7c2"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.30/credhub-linux-amd64-2.9.30.tgz"
    sha256 "5fd2f5c34337a688a45d8353cb56d9f1625a78adba6fb92b825d8c92532d9b27"
  end

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
