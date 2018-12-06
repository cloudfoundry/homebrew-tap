class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.2.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.2.0/credhub-darwin-2.2.0.tgz"
  sha256 "65943ad1922c26b54874348042a4f13ac2d43e753a7be77b6947a8d542e7f760"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
