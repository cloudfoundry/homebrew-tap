#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.73/bbr-1.9.73-darwin-arm64"
      sha256 "dca4174bada182c57a4a0fec486655665295dd68c05288e1553f24afe59ea6e7"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.73/bbr-1.9.73-darwin-amd64"
      sha256 "dca4174bada182c57a4a0fec486655665295dd68c05288e1553f24afe59ea6e7"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.73/bbr-1.9.73-linux-amd64"
    sha256 "7cc6b87ccb6c796e8c26d6cd840f82a9f00892c16a0e23a0e5bb214443f71c6c"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.73-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.73-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.73-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
