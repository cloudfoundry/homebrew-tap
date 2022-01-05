class BoshCli < Formula
  desc "BOSH CLI"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "6.4.11"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-arm64"
      sha256 ""
    else
      url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
      sha256 "22f0340bb6c17e1f6418f099fc949fd5802608e8b206112658c6bfcd6ea25dee"
    end
  elsif OS.linux?
    url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-linux-amd64"
    sha256 "ea3960f25c561346ab073c3d2133b9e5d35a62f1cd39cdcb986bff45c0ab0536"
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
