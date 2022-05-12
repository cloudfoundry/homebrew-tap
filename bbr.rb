class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore"
  url "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v1.9.30/bbr-1.9.30.tar"
  sha256 "ca8b6aa616c52e7f1d8c64a0d2b176d5eca06f89fa0f6f97982117e4c2516bc8"

  depends_on :arch => :x86_64

  def install
    bin.install "bbr-mac" => "bbr"
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
