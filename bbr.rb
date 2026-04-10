#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.78/bbr-1.9.78-darwin-arm64"
      sha256 "7be16ca2d419e08bb9542db1665e4f7ca8b94199878fe1037a601da661fa328e"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.78/bbr-1.9.78-darwin-amd64"
      sha256 "967c5d047d0759ed40891c12819cfce183cdb311014e2c893e001a6bd7e5aa6c"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.78/bbr-1.9.78-linux-amd64"
    sha256 "cb7376c82d1b358f8fbe5bc1fff34a9b622b2596644680ec98bbb87f79152e94"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.78-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.78-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.78-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
