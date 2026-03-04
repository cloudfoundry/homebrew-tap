class CfCliAT8 < Formula
  desc     "Cloud Foundry CLI"
  homepage "https://code.cloudfoundry.org/cli"
  version  "8.18.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://packages.cloudfoundry.org/homebrew?arch=macosarm&version=8.18.0"
      sha256 "1a02bd90faab1bcde7fc31d4dd5b5114755d671c648fd209e47cc7a2a19629bb"
    elsif
      url "https://packages.cloudfoundry.org/homebrew?arch=macosx64&version=8.18.0"
      sha256 "c2f4f8f424d89e84ac6aa460dfae3418034d68432446ae55148c68c400ddc0ca"
    end
  elsif OS.linux?
    url "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=8.18.0&source=homebrew"
    sha256 "d7f5f24eea21cd5d585b8504005ead5a67a2e6e3edddd5b51a3d1e70f595ba46"
  end

  def install
    bin.install "cf8"
    bin.install_symlink "cf8" => "cf"
    (bash_completion/"cf8-cli").write <<-completion
# bash completion for Cloud Foundry CLI

_cf-cli() {
    # All arguments except the first one
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
    # Only split on newlines
    local IFS=$'\n'
    # Call completion (note that the first element of COMP_WORDS is
    # the executable itself)
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}
complete -F _cf-cli cf8
complete -F _cf-cli cf
    completion
    doc.install "LICENSE"
    doc.install "NOTICE"
  end

  test do
    system "#{bin}/cf8"
  end
end
