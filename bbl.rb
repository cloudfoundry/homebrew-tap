class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v5.10.0"

  if OS.mac?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
    sha256 "534b7fa68660f5a81d73cc975c3ea6395dafc22e018923816a5c5483990548e0"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    sha256 "1532c44d28a4a3864aaa87997b7bdb8a38af792601222a64f4765afb01431792"
  end

  depends_on :arch => :x86_64
  depends_on "terraform" => "0.10.0"
  depends_on "cloudfoundry/tap/bosh-cli" => "2.0.29"

  def install
    binary_name = "bbl"
    if OS.mac?
      bin.install "bbl-#{version}_osx" => binary_name
    elsif OS.linux?
      bin.install "bbl-#{version}_linux_x86-64" => binary_name
    end
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
