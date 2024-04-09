#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.63/bbr-1.9.63-darwin-arm64"
      sha256 "8e4d26b236a400cc7fdb6e23c18fd9eb27273595e12d1032f0224451479199ff"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.63/bbr-1.9.63-darwin-amd64"
      sha256 "8e4d26b236a400cc7fdb6e23c18fd9eb27273595e12d1032f0224451479199ff"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.63/bbr-1.9.63-linux-amd64"
    sha256 "f4722cae7891451aa067030806ca997d124de3f5147e38bd05d5925436572e56"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.63-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.63-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.63-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
