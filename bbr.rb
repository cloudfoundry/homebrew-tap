#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.82/bbr-1.9.82-darwin-arm64"
      sha256 "409913e67d86f5742d51b829c50802d43215e0eb6cc4a297b11c6eb6e4e07946"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.82/bbr-1.9.82-darwin-amd64"
      sha256 "c5867cc9d6052cf3e637e737ad81b6ead93a01d8966520163da5d3ddb100e8ea"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.82/bbr-1.9.82-linux-amd64"
    sha256 "5cbd221d9ca0edecadb92cf429c143410cfe6f747768f426252c521eca0b2141"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.82-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.82-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.82-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
