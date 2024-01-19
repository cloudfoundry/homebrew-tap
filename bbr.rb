#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.58/bbr-1.9.58-darwin-arm64"
      sha256 "f5195c8f068ec3f3366bbab728d0a3f3435f4d0b9b9e0a6abc4fbffd6a2ead9f"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.58/bbr-1.9.58-darwin-amd64"
      sha256 "f5195c8f068ec3f3366bbab728d0a3f3435f4d0b9b9e0a6abc4fbffd6a2ead9f"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.58/bbr-1.9.58-linux-amd64"
    sha256 "30af3cf4dbb8dfb62eb7b5187965de933dc931942ff51d63cf0216c5bfa23321"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.58-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.58-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.58-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
