class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.0.1"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.0.1/credhub-darwin-2.0.1.tgz"
  sha256 "f72e7a8281e6c8d992be231e2062a4d9dae2f41f6ba0c0eea3eef831ea795033"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
