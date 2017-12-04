class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v5.6.5"

  if OS.mac?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
    sha256 "cebf4c1b4be0887294f004dd2d5547d518efe2b3ef7390ebaaac74b2114d31c6"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    sha256 "368d269e7c8fbacbf3dfd42872610965c67b4dcb31af1ff6eb01b376395b03b6"
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
