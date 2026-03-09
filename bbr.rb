#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.77/bbr-1.9.77-darwin-arm64"
      sha256 "f9dac30ecd77aba43158ba9e86130a6104300e80409990b17bc37aa378b94dfa"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.77/bbr-1.9.77-darwin-amd64"
      sha256 "b79a03ce637d2fceb833a467d6f8fa0778f4cf695ab1ca94b926a00c474eadd6"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.77/bbr-1.9.77-linux-amd64"
    sha256 "2a764f59cbeaaaa0a62135be077e72de55bfe3cd88dcf7a0ffd9b6513ba1626d"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.77-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.77-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.77-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
