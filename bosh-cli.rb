class BoshCli < Formula
  desc "BOSH CLI"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "7.10.4"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-arm64"
      sha256 "1a1a84b1cac8b67820532ecce669ac6fc55ed838d73adb21003f6a6871e2299c"
    else
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
      sha256 "136f580dac1f9b31d452543bce17ac9dcafc9dc2095aa01d60bae05ec2a7fa76"
    end
  elsif OS.linux?
    url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-linux-amd64"
    sha256 "c4f1187d615daa8ef4543bc6f87cba6623200062bcd521c5977119dcfe6d4740"
  end

  option "with-bosh2", "Rename binary to 'bosh2'. Useful if the old Ruby CLI is needed."

  def install
    binary_name = build.with?("bosh2") ? "bosh2" : "bosh"
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bosh-cli-#{version}-darwin-arm64" => binary_name
      else
        bin.install "bosh-cli-#{version}-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bosh-cli-#{version}-linux-amd64" => binary_name
    end
    (bash_completion/"bosh-cli").write <<-completion
      _#{binary_name}() {
          # All arguments except the first one
          args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
          # Only split on newlines
          local IFS=$'\n'
          # Call completion (note that the first element of COMP_WORDS is
          # the executable itself)
          COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
          return 0
      }
      complete -o default -F _#{binary_name} #{binary_name}
    completion
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
