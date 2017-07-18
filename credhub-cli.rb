class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.2.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.2.0/credhub-darwin-1.2.0.tgz"
  sha256 "f0085d349503075faffe2e88b92e9eac492330a664d31948bf6fc7d6d457c407"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
