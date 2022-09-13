class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore"
  url "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v1.9.38/bbr-1.9.38.tar"
  sha256 "548455aecf4d13f2a901efbf1ef32a2b6197c86a3e39974cc3350452b196bb2e"

  depends_on :arch => :x86_64

  def install
    bin.install "bbr-mac" => "bbr"
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
