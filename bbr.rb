class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore"
  url "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v1.9.14/bbr-1.9.14.tar"
  sha256 "4c49ab3ca21fea2d06516f110b76b5c0863ea40c226e865292876cffb153f906"

  depends_on :arch => :x86_64

  def install
    bin.install "bbr-mac" => "bbr"
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
