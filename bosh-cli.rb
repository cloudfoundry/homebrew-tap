class BoshCli < Formula
  desc "BOSH CLI"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "7.10.1"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-arm64"
      sha256 "fc698f487e0a83b84bf02ccaefd9d145ecd3e9102fc5ab1d9399c34e1a1e7d92"
    else
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
      sha256 "5e67600faf2b9a26038d696d48d341697be1c003696184048414130e451ce66d"
    end
  elsif OS.linux?
    url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-linux-amd64"
    sha256 "798bb0b2e36890e77aa823d1fb05c9a2abd6ec18045016ee748f6c81d180f51c"
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
