class BoshCli < Formula
  desc "BOSH CLI"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "7.3.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-arm64"
      sha256 "ff5dcb93f461a8a05da2eddc9fd1c2a1789e68b2b129e413cc0258e8c31c58d1"
    else
      url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
      sha256 "60a2270fbd57d5d1819655b9bf62766ef1c1a3bbd73308db02b5b446d37b8981"
    end
  elsif OS.linux?
    url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-linux-amd64"
    sha256 "f6f80461208f186aa3587b25abc12b86e217e7c96594e335de3c17f4ed683a3f"
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
