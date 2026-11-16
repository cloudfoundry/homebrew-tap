class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v9.0.53"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_arm64"
      sha256 "f78cbb19c1d5c57218a96befc87dab721491c341f2add1dcb2707575b3e34a6a"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx_amd64"
      sha256 "1ef11ce71d511e41a2609287d8d68a55852d62357f6ee0b6c9a1dc441df37734"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_arm64"
      sha256 "6d567e9613d7342cd92eacfab0ac9bbe9f110df14ea382bb6c232063d9eaf527"
    else
      url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_amd64"
      sha256 "b3a7466c3c1aa1a599c3063fb30f8276a0bca4f27be00807e069094ab585678b"
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
