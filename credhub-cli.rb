class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.5.3"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.5.3/credhub-darwin-2.5.3.tgz"
    sha256 "03f46790ac2f99ee7bf35cf656026e053fef1a323f04fcbe848965f1064733c9"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.5.3/credhub-linux-2.5.3.tgz"
    sha256 "db74c8fa2d73594b84e11a9562927e2c558a2c7454870f8df298347fba946240"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
