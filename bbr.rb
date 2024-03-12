#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.61/bbr-1.9.61-darwin-arm64"
      sha256 "a542a74fb7c11ab1e65b22926e8a8bdb26df88147e3c45798affaf2b1e9222ba"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.61/bbr-1.9.61-darwin-amd64"
      sha256 "a542a74fb7c11ab1e65b22926e8a8bdb26df88147e3c45798affaf2b1e9222ba"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.61/bbr-1.9.61-linux-amd64"
    sha256 "abc7d418f19c91521ae7747518f51572de6c2267c13f768a2b8e49084ac16b14"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.61-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.61-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.61-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
