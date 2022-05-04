class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore"
  url "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v1.9.29/bbr-1.9.29.tar"
  sha256 "f0a2d1bc9c4fadc51b242f2af9e644c55b5a5591f9a1711e0dfeaf9d46ac97cc"

  depends_on :arch => :x86_64

  def install
    bin.install "bbr-mac" => "bbr"
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
