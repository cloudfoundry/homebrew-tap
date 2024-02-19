#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.60/bbr-1.9.60-darwin-arm64"
      sha256 "582026909c609e526f62c9b180e6694eee612266a84e26e39be729da34166230"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.60/bbr-1.9.60-darwin-amd64"
      sha256 "582026909c609e526f62c9b180e6694eee612266a84e26e39be729da34166230"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.60/bbr-1.9.60-linux-amd64"
    sha256 "bb0fdac04d005ac6e58fc9e4ce672d2c3743a16e6185ce460828208d69ef5983"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.60-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.60-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.60-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
