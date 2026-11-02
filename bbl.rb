class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v9.0.52"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_arm64"
      sha256 "d692730e8e60b85afe7bc93cbddb9375c7e755a9729fd2b9d6cfa7217d8e62f1"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_amd64"
      sha256 "c9e4211b902a6edd14d4efd871c2f6a02715e1fd757d9d0ac7ac3b47d43e0fa2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_arm64"
      sha256 "02b26d7d46cf28487c0543fbf2a430b4aab2a23c09f7dda900b5d16fac4cd3fc"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_amd64"
      sha256 "4969e868c9eeed2cd3c942bfb25038d14423936a7257a336228295eab9ca0369"
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
