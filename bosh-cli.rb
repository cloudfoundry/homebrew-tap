class BoshCli < Formula
  desc "BOSH CLI"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "7.6.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-arm64"
      sha256 "621b51ecb9102c83e68c0a08ca0cf3dcadc12bbaaacc4dcef7d24868eed862c2"
    else
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
      sha256 "35acdccd2e462b362ec3892af60c094ee80ebc5eafa9d0e003a97375b04a0de5"
    end
  elsif OS.linux?
    url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-linux-amd64"
    sha256 "b4acaa01c0703af5de6b8c8044799fbacf43bd9200087d0c34ed25d7f882dc43"
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
