#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.76/bbr-1.9.76-darwin-arm64"
      sha256 "9b6d49a67ff20283338e56110d15847620593911dfb8a614c94e3b96cd16110e"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.76/bbr-1.9.76-darwin-amd64"
      sha256 "6567e69236f7fa456b62eefcd408b329e8c61dc1ee927e13091c3315973fbdda"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.76/bbr-1.9.76-linux-amd64"
    sha256 "e693cef7b253165f83cab5b25b3d58cf082dca1a7d0af724ec162faca2587ee1"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.76-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.76-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.76-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
