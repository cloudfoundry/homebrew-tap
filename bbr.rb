class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore"
  url "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v1.9.42/bbr-1.9.42.tar"
  sha256 "a709d93441be139d228bea92b913828ae5ae01107a0b73bbc5b4169849abcd16"

  depends_on :arch => :x86_64

  def install
    bin.install "bbr-mac" => "bbr"
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
