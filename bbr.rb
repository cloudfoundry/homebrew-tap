#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.65/bbr-1.9.65-darwin-arm64"
      sha256 "747de5b73d21765411c14966aa99faa54b60b8d4b1051a37884c683893f2b09c"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.65/bbr-1.9.65-darwin-amd64"
      sha256 "747de5b73d21765411c14966aa99faa54b60b8d4b1051a37884c683893f2b09c"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.65/bbr-1.9.65-linux-amd64"
    sha256 "7bf26d664d889eca41289ee5bea291a49da33f5d358e70e07495ba525f5c56b5"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.65-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.65-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.65-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
