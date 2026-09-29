#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.81/bbr-1.9.81-darwin-arm64"
      sha256 "7a9cf3bf89a7944264117ce993250d294dc01e4e3df261302fc05839cc3ed71d"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.81/bbr-1.9.81-darwin-amd64"
      sha256 "dac6d405a8a559e97cd9e775ad6790d5742159610518f8d7ce96fb2bc40381f3"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.81/bbr-1.9.81-linux-amd64"
    sha256 "085dc93f8ddf4a7853a219482261f4ceec04dd2764577584da9fb6b45c62f59f"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.81-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.81-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.81-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
