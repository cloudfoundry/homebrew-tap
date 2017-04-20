class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "0.6.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/0.6.0/credhub-darwin-0.6.0.tgz"
  sha256 "24c478b7edb32bc9366be982d740acdd98615aac39b8d61795213141641a7a52"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
