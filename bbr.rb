#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.50/bbr-1.9.50-darwin-arm64"
      sha256 "3a35f859cb408b9da7c2c8275815c243584cc90f954f3abd35519edbb0f43ed5"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.50/bbr-1.9.50-darwin-amd64"
      sha256 "3a35f859cb408b9da7c2c8275815c243584cc90f954f3abd35519edbb0f43ed5"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.50/bbr-1.9.50-linux-amd64"
    sha256 "0a9b262b878bb08f0fcb830170fa1eff92a40e3254ea2a43a473a23c6ea677dd"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.50-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.50-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.50-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end

