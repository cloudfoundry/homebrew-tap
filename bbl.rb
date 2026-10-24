class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v9.0.51"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_arm64"
      sha256 "f89f75a89f6906a8bf74b3ec06ae500ec7538afadc128bf27219cf8e0c1c4d2d"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_amd64"
      sha256 "8011705253d52dfc948d3aef185211fb9a0f3e4695c9eeaf9106530c2077180b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_arm64"
      sha256 "fcd5446b0f14e369bee1f9d30cc78ed8ab4aea6b23242d37c4653119bc0aa10a"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_amd64"
      sha256 "aa10489d571ff17886e8b134cdd7595738d8aed8216e530f0be21ff237f9cb66"
    end
  end

  def install
    binary_name = "bbl"
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbl-#{version}_osx_arm64" => binary_name
      else
        bin.install "bbl-#{version}_osx_amd64" => binary_name
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "bbl-#{version}_linux_arm64" => binary_name
      else
        bin.install "bbl-#{version}_linux_amd64" => binary_name
      end
    end
  end

  test do
    system "#{bin}/bbl", "--help"
  end
end
