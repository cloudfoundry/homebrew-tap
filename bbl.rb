class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v9.0.50"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_arm64"
      sha256 "2f5b3b004be3aa757d21b0e59afb5e8d82c2791cec3df1dd118110da16ae9bc1"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_amd64"
      sha256 "c1c6f6d84160a00462afd1ee2a7932d6752c870141a742dee7e0fcec1fd15628"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_arm64"
      sha256 "f2c524701bd190c5f3e0476249208745ede59c3795e5083e7618962f5bf51d63"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_amd64"
      sha256 "3caf9954951dc2d81e530d09b25acf876aeb2bccc079e3c92e9e9860695361cf"
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
