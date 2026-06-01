class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v9.0.45"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_arm64"
      sha256 "043fddfa1f5422a7cb79c2089f75d2e81a27933cb12b9008ac5dffe6b55af11c"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_amd64"
      sha256 "e0655883737237bd44ef53d9929b0309c6fe6130a5f3218225c411872a58ba87"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_arm64"
      sha256 "888fc7d2a0532de1aa2622b95a4e3cc75659e42509f03ebf1a1947b746001f01"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_amd64"
      sha256 "04599c855dac3888ff9d317818596106971d92da0c89bd15c519af1582d161f0"
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
