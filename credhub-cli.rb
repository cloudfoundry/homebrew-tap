class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.7.4"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.7.4/credhub-darwin-1.7.4.tgz"
  sha256 "78cd9d97e3c32d0094a5c7759a5e5096a7efe0899d97487ee088cf389dc2c381"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
