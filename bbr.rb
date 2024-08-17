#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.68/bbr-1.9.68-darwin-arm64"
      sha256 "e4fc3823bd84480c59fc90011b64b7b1d632ea9240238e0026a1afe9cb3dfd23"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.68/bbr-1.9.68-darwin-amd64"
      sha256 "e4fc3823bd84480c59fc90011b64b7b1d632ea9240238e0026a1afe9cb3dfd23"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.68/bbr-1.9.68-linux-amd64"
    sha256 "8f70ac5599d56103f18f8e34d0daa96fd95b28b7ea4fa0ab57536aa30df5c888"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.68-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.68-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.68-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
