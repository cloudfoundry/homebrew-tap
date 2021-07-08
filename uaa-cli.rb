class UaaCli < Formula
  desc "CLI for UAA written in golang"
  homepage "https://github.com/cloudfoundry-incubator/uaa-cli"
  version "0.10.0"


  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/#{version}/uaa-darwin-amd64-#{version}"
    sha256 "482cd886a2abd60678c292b126e4c869c1305a610fbe8d05a78207e22edeff88"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/uaa-cli/releases/download/#{version}/uaa-linux-amd64-#{version}"
    sha256 ""
  end

  depends_on :arch => :x86_64

  def install
    binary_name = "uaa"
    if OS.mac?
      bin.install "uaa-darwin-amd64-#{version}" => binary_name
    elsif OS.linux?
      bin.install "uaa-linux-amd64-#{version}" => binary_name
    end
  end

  test do
    system "#{bin}/uaa"
  end
end
